//
//  EPGRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/28/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol EPGRepository {
    
    func programs(pghash: String,
                  channels: [ChannelId],
                  start: Date,
                  end: Date,
                  success: @escaping([ChannelEPGModel]) -> Void,
                  failure: @escaping (ErrorModel) -> Void)
    
    func details(for programs: [ProgramId],
                 pghash: String,
                 success: @escaping ([ProgramModel]) -> Void,
                 failure: @escaping (ErrorModel) -> Void)

    func seriesDetails(forSeriesId seriesId: SeriesId,
                       channelId: ChannelId,
                       seasonSpec: SeasonSpec,
                       sorting: String?,
                       isRecordingsOnly: Bool,
                       success: @escaping (SeriesDetailsModel) -> Void,
                       failure: @escaping (ErrorModel) -> Void)
}
