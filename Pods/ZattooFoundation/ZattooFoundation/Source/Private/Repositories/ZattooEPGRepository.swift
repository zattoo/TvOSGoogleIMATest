//
//  ZattooEPGRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/28/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ZattooEPGRepository: EPGRepository {
    private let networkDataSource: EPGNetworkDataSource
    
    // MARK: - Initializers
    
    init(networkDataSource: EPGNetworkDataSource = ZattooEPGNetworkDataSource()) {
        self.networkDataSource = networkDataSource
    }
    
    // MARK: - EPGRepository
    
    func programs(pghash: String,
                  channels: [ChannelId],
                  start: Date,
                  end: Date,
                  success: @escaping ([ChannelEPGModel]) -> Void,
                  failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.fetch(
            pghash: pghash,
            channels: channels,
            start: start,
            end: end,
            success: {
                channelsEPGEntities in
                success(channelsEPGEntities.map { $0.model })
        },
            failure: { failure($0.model) })
    }
    
    func details(for programs: [ProgramId],
                 pghash: String,
                 success: @escaping ([ProgramModel]) -> Void,
                 failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.details(
            forPrograms: programs,
            pghash: pghash,
            success: {
                programEntities in
                success(programEntities.map { $0.model})
        },
            failure: { failure($0.model) })
    }

    func seriesDetails(forSeriesId seriesId: SeriesId,
                       channelId: ChannelId,
                       seasonSpec: SeasonSpec,
                       sorting: String?,
                       isRecordingsOnly: Bool,
                       success: @escaping (SeriesDetailsModel) -> Void,
                       failure: @escaping (ErrorModel) -> Void) {

        networkDataSource.seriesDetails(
            forSeriesId: seriesId,
            channelId: channelId,
            seasonSpec: seasonSpec,
            sorting: sorting,
            isRecordingsOnly: isRecordingsOnly,
            success: { success($0.model) },
            failure: { failure($0.model) }
        )
    }
}
