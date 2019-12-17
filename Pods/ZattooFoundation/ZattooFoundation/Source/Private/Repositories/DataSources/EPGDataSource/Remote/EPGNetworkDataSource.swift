//
//  EPGNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/28/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol EPGNetworkDataSource {

    func fetch(pghash: String,
               channels: [ChannelId],
               start: Date,
               end: Date,
               success: @escaping ([ChannelEPGEntity]) -> Void,
               failure: @escaping (NetworkEntityError) -> Void)

    func details(forPrograms programs: [ProgramId],
                             pghash: String,
                             success: @escaping ([ProgramEntity]) -> Void,
                             failure: @escaping (NetworkEntityError) -> Void)

    func seriesDetails(forSeriesId seriesId: SeriesId,
                       channelId: ChannelId,
                       seasonSpec: SeasonSpec,
                       sorting: String?,
                       isRecordingsOnly: Bool,
                       success: @escaping (SeriesDetailsEntity) -> Void,
                       failure: @escaping (NetworkEntityError) -> Void)
}
