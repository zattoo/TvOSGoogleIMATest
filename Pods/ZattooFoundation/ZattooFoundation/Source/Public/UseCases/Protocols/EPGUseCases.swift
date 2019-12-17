//
//  EPGUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/28/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation

public protocol EPGUseCases {

    func programs(channels: [ChannelId],
                  start: Date,
                  end: Date,
                  success: @escaping ([ChannelEPG]) -> Void,
                  failure: @escaping (Error) -> Void)

    func programs(for type: ChannelListType,
                  start: Date,
                  blockDurationInHours: Int,
                  success: @escaping ([ChannelEPG]) -> Void,
                  failure: @escaping (Error) -> Void)

    func programs(for type: ChannelListType,
                  start: Date,
                  blockDurationInHours: Int,
                  fillingGaps: Bool,
                  success: @escaping ([ChannelEPG]) -> Void,
                  failure: @escaping (Error) -> Void)

    func program(after programId: ProgramId,
                 success: @escaping (Program?) -> Void,
                 failure: @escaping (Error) -> Void)

    func nowAndNextPrograms(channels: [ChannelId],
                            fillingGaps: Bool,
                            success: @escaping ([ChannelEPG]) -> Void,
                            failure: @escaping (Error) -> Void)
    
    func details(for program: ProgramId,
                 success: @escaping (Program) -> Void,
                 failure: @escaping (Error) -> Void)

    func seriesDetails(forSeriesId seriesId: SeriesId,
                       channelId: ChannelId,
                       seasonSpec: SeasonSpec,
                       sorting: String?,
                       isRecordingsOnly: Bool,
                       success: @escaping (SeriesDetails) -> Void,
                       failure: @escaping (Error) -> Void)
}
