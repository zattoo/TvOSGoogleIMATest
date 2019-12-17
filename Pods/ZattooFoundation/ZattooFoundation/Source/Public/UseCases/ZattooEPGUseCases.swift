//
//  ZattooEPGUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/28/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftDate


private let nowAndNextBlockDurationInHours = 3
private let nowBlockBuffer: TimeInterval = 720

final public class ZattooEPGUseCases: EPGUseCases {
    
    private let sessionRepository: SessionRepository
    private let epgRepository: EPGRepository
    private let favoritesRepository: FavoritesRepository
    
    // MARK: - Initializers
    
    public convenience init() {
        self.init(sessionRepository: ZattooSessionRepository(), epgRepository: ZattooEPGRepository(), favoritesRepository: ZattooFavoritesRepository())
    }
    
    init(sessionRepository: SessionRepository, epgRepository: EPGRepository, favoritesRepository: FavoritesRepository) {
        self.sessionRepository = sessionRepository
        self.epgRepository = epgRepository
        self.favoritesRepository = favoritesRepository
    }
    
    // MARK: - EPGUseCases

    public func programs(channels: [ChannelId],
                         start: Date,
                         end: Date,
                         success: @escaping ([ChannelEPG]) -> Void,
                         failure: @escaping (Error) -> Void) {

        var blockDuration = end.hour - start.hour

        if !end.compare(.isSameDay(start)) {
            blockDuration = (24 - start.hour) + end.hour
        }

        let block = epgBlock(start: start, blockDurationInHours: blockDuration)

        sessionRepository.session(
            success: {
                [weak self] session in

                self?.epgRepository.programs(
                    pghash: session.pghash,
                    channels: channels,
                    start: block.start,
                    end: block.end,
                    success: {
                        channelEPGModels in

                        let noGapsChannelEPGModels = channelEPGModels.map { $0.fillGapsInPrograms(from: start, to: end) }
                        success(noGapsChannelEPGModels.map { $0.DTO })
                },
                    failure: { failure($0.DTO) })
            },
            failure: { failure ($0.DTO) }
        )
    }

    public func programs(for type: ChannelListType,
                         start: Date,
                         blockDurationInHours: Int,
                         success: @escaping ([ChannelEPG]) -> Void,
                         failure: @escaping (Error) -> Void) {

        programs(for: type,
                 start: start,
                 blockDurationInHours: blockDurationInHours,
                 fillingGaps: true,
                 success: success,
                 failure: failure)
    }

    public func programs(for type: ChannelListType,
                         start: Date,
                         blockDurationInHours: Int,
                         fillingGaps: Bool,
                         success: @escaping ([ChannelEPG]) -> Void,
                         failure: @escaping (Error) -> Void) {

        sessionRepository.session(
            success: {
                [weak self] session in

                switch type {
                case .all, .categories:
                    self?.programs(pghash: session.pghash,
                                  channels: [],
                                  start: start,
                                  blockDurationInHours: blockDurationInHours,
                                  fillingGaps: fillingGaps,
                                  success: success,
                                  failure: failure)
                case .favorites:
                    self?.programsFromFavoriteChannels(pghash: session.pghash,
                                                      start: start,
                                                      blockDurationInHours: blockDurationInHours,
                                                      fillingGaps: fillingGaps,
                                                      success: success,
                                                      failure: failure)
                }
        },
            failure: { failure ($0.DTO) }
        )
    }

    public func program(after programId: ProgramId,
                        success: @escaping (Program?) -> Void,
                        failure: @escaping (Error) -> Void) {

        details(for: programId,
                success: {
                    program in
                    self.programs(channels: [program.cid],
                                  start: program.end.addingTimeInterval(-nowBlockBuffer),
                                  end: program.end.addingTimeInterval(TimeInterval(nowAndNextBlockDurationInHours) * 3600),
                                  success: {
                                    channelEpgs in
                                    success(self.program(after: programId, epg: channelEpgs))
                    },
                                  failure: failure)
        },
                failure: failure)
    }

    public func nowAndNextPrograms(channels: [ChannelId],
                                   fillingGaps: Bool,
                                   success: @escaping ([ChannelEPG]) -> Void,
                                   failure: @escaping (Error) -> Void) {

        sessionRepository.session(
            success: {
                [weak self] session in

                let now = Date()
                self?.programs(pghash: session.pghash,
                               channels: channels,
                               start: now,
                               blockDurationInHours: nowAndNextBlockDurationInHours,
                               fillingGaps: fillingGaps,
                               success: success,
                               failure: failure)
            },
            failure: { failure ($0.DTO) }
        )
    }
    
    public func details(for program: ProgramId,
                        success: @escaping (Program) -> Void,
                        failure: @escaping (Error) -> Void) {
        
        sessionRepository.session(
            success: {
                [weak self] session in

                self?.epgRepository.details(
                    for: [program],
                    pghash: session.pghash,
                    success: {
                        programModels in
                        if let program = programModels.first {
                            success(program.DTO)
                        }
                        else {
                            failure(Error(code:.resourceNotFound))
                        }
                },
                failure: { failure ($0.DTO) })
        },
            failure: { failure ($0.DTO) }
        )
    }

    public func seriesDetails(forSeriesId seriesId: SeriesId,
                              channelId: ChannelId,
                              seasonSpec: SeasonSpec,
                              sorting: String?,
                              isRecordingsOnly: Bool,
                              success: @escaping (SeriesDetails) -> Void,
                              failure: @escaping (Error) -> Void) {

        epgRepository.seriesDetails(
            forSeriesId: seriesId,
            channelId: channelId,
            seasonSpec: seasonSpec,
            sorting: sorting,
            isRecordingsOnly: isRecordingsOnly,
            success: { success($0.DTO) },
            failure: { failure($0.DTO) }
        )
    }
    
    // MARK: - Private
    
    private func epgBlock(start: Date, blockDurationInHours blockDuration: Int) -> (start: Date, end: Date) {
        let blockStart = start.dateAtStartOf(.hour)
        let blockEnd = blockDuration.hours.from(blockStart) ?? blockStart
        return (start: blockStart, end: blockEnd)
    }

    private func programsFromFavoriteChannels(pghash: String,
                                              start: Date,
                                              blockDurationInHours: Int,
                                              fillingGaps: Bool,
                                              success: @escaping ([ChannelEPG]) -> Void,
                                              failure: @escaping (Error) -> Void) {

        favoritesRepository.refresh(
            success: {
                [weak self] favorites in
                    self?.programs(pghash: pghash,
                                  channels: favorites,
                                  start: start,
                                  blockDurationInHours: blockDurationInHours,
                                  fillingGaps: fillingGaps,
                                  success: success,
                                  failure: failure)
            },
            failure: { failure($0.DTO) })
    }

    private func programs(pghash: String,
                         channels: [ChannelId],
                         start: Date,
                         blockDurationInHours: Int,
                         fillingGaps: Bool,
                         success: @escaping ([ChannelEPG]) -> Void,
                         failure: @escaping (Error) -> Void) {

        let block = epgBlock(start: start, blockDurationInHours: blockDurationInHours)
        epgRepository.programs(
            pghash: pghash,
            channels: channels,
            start: block.start,
            end: block.end,
            success: {
                channelEPGModels in

                var resultEPGModels = channelEPGModels
                if fillingGaps {
                    let noGapsChannelEPGModels = channelEPGModels.map {
                        $0.fillGapsInPrograms(from: block.start, to: block.end)
                    }
                    resultEPGModels = noGapsChannelEPGModels
                }

                success(resultEPGModels.map { $0.DTO })
        },
            failure: { failure($0.DTO) })
    }

    private func program(after id: ProgramId, epg: [ChannelEPG]) -> Program? {
        if let programs = epg.first?.programs {
            for (index, epgProgram) in programs.enumerated() {
                if epgProgram.id == id, programs.count > index {
                    return programs[index + 1]
                }
            }
        }
        return nil
    }
}
