//
//  ZattooSearchUseCases.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 7/12/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class ZattooSearchUseCases: NSObject, SearchUseCases {
    
    private let sessionRepository: SessionRepository
    private let channelListRepository: ChannelListRepository
    private let recordingsRepository: RecordingsRepository
    private let avodVideoRepository: AvodVideoRepository
    private let programRepository: ProgramRepository
    private let vodRepository: VodRepository
    private var inProgressAvodVideoSearch: Cancelable?
    private var inProgressProgramSearch: Cancelable?
    private var inProgressVodSearch: Cancelable?

    // MARK: - InitializerschannelListRepository: ZattooChannelListRepository()
    
    convenience public override init() {
        self.init(sessionRepository: ZattooSessionRepository(),
                  avodVideoRepository: ZattooAvodVideoRepository(),
                  recordingsRepository: ZattooRecordingsRepository(),
                  channelListRepository: ZattooChannelListRepository(),
                  programRepository: ZattooProgramRepository(),
                  vodRepository: ZattooVodRepository())
    }
    
    init(sessionRepository: SessionRepository,
         avodVideoRepository: AvodVideoRepository,
         recordingsRepository: RecordingsRepository,
         channelListRepository: ChannelListRepository,
         programRepository: ProgramRepository,
         vodRepository: VodRepository) {
        
        self.sessionRepository = sessionRepository
        self.avodVideoRepository = avodVideoRepository
        self.recordingsRepository = recordingsRepository
        self.channelListRepository = channelListRepository
        self.programRepository = programRepository
        self.vodRepository = vodRepository
        super.init()
    }
    
    // MARK: - SearchUseCases
    
    @objc
    public func searchAvodVideos(query: String,
                                 success: @escaping ([AvodVideo]) -> Void,
                                 failure: @escaping (Error) -> Void) {
        inProgressAvodVideoSearch?.cancel()
        inProgressAvodVideoSearch = avodVideoRepository.search(query: query,
                                                               success: { success($0.DTOs) },
                                                               failure: { failure($0.DTO) })
    }
    
    @objc
    public func searchChannels(query: String,
                               success: @escaping ([Channel]) -> Void,
                               failure: @escaping (Error) -> Void) {
        
        sessionRepository.session(
            success: {
                [weak self] session in
                
                self?.channelListRepository.fetch(
                    pghash: session.pghash,
                    success: {
                        channelGroupModels in
                        let channelListGroups = channelGroupModels.map { $0.DTO }
                        let channelList = channelListGroups.flatMap { $0.channels }
                        success(channelList.filter { $0.title.lowercased().range(of: query.lowercased()) != nil })
                    },
                    failure: { failure($0.DTO) })
            },
            failure: { failure ($0.DTO) })
    }
    
    @objc
    public func searchRecordings(query: String,
                                 success: @escaping ([Recording]) -> Void,
                                 failure: @escaping (Error) -> Void) {
        
        sessionRepository.session(
            success: {
                [weak self] session in
                guard session.isRecordingsEligible else {
                    return failure(Error(code: .recordingRequired))
                }
                
                self?.recordingsRepository.fetch(
                    success: {
                        listOfRecordingModels in
                        let recordings = listOfRecordingModels.recordings.map { $0.DTO }
                        success(recordings.filter { $0.title.lowercased().range(of: query.lowercased()) != nil })
                    },
                    failure: { failure($0.DTO) })
            },
            failure: { failure ($0.DTO) })
    }
    
    @objc
    public func searchPrograms(query: String,
                               timeframe: ProgramSearchTimeframe,
                               success: @escaping ([Program]) -> Void,
                               failure: @escaping (Error) -> Void) {
        
        inProgressProgramSearch?.cancel()
        inProgressProgramSearch = programRepository.search(query: query,
                                                           timeframe: timeframe,
                                                           success: { success($0.DTOs) },
                                                           failure: { failure($0.DTO) })
    }
    
    public func searchVod(query: String,
                          success: @escaping (VodSearchResult) -> Void,
                          failure: @escaping (Error) -> Void) {

        inProgressVodSearch?.cancel()
        sessionRepository.session(
            success: {
                [weak self] session in

                guard session.isVodEligible else {
                    return failure(Error(code: .vodRequired))
                }
                
                self?.inProgressVodSearch = self?.vodRepository.search(
                    pghash: session.pghash,
                    query: query,
                    success: { success($0.DTO) },
                    failure: { failure($0.DTO) })
            },
            failure: { failure ($0.DTO) }
        )
    }
}
