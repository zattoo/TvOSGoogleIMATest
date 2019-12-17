//
//  SeriesDetailsEntity.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 17.10.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


struct SeriesDetailsEntity: Codable {

    let tvSeriesId: Int
    let numTotalEpisodes: Int
    let numAvailableEpisodes: Int
    let numFutureEpisodes: Int
    let isSeriesRecordingEligible: Bool
    let isSeriesRecordingActive: Bool
    let title: String
    let cid: ChannelId
    let imageToken: String
    let sortings: [SortingEntity]
    let currentSorting: String?
    let programs: [ProgramEntity]
    let seasonNumbers: [Int]
    let currentSeasonNumber: Int?
    let displayManageRecordings: Bool
}
