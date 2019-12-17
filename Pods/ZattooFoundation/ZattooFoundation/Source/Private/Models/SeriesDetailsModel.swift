//
//  SeriesDetailsModel.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 18.10.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


struct SeriesDetailsModel {

    let tvSeriesId: SeriesId
    let numTotalEpisodes: Int
    let numAvailableEpisodes: Int
    let numFutureEpisodes: Int
    let isSeriesRecordingEligible: Bool
    let isSeriesRecordingActive: Bool
    let title: String
    let cid: ChannelId
    let imageToken: String
    let sortings: [SortingModel]
    let currentSorting: String?
    let programs: [ProgramModel]
    let seasonNumbers: [Int]
    let currentSeasonNumber: Int?
    let displayManageRecordings: Bool
}
