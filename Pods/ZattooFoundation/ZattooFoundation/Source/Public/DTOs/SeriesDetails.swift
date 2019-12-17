//
//  SeriesDetails.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 18.10.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class SeriesDetails: NSObject {

    public let tvSeriesId: SeriesId
    public let numTotalEpisodes: Int
    public let numAvailableEpisodes: Int
    public let numFutureEpisodes: Int
    public let isSeriesRecordingEligible: Bool
    public let isSeriesRecordingActive: Bool
    public let title: String
    public let cid: ChannelId
    public let imageToken: String?
    public let sortings: [SeriesSorting]
    public let currentSorting: String?
    public let programs: [Program]
    public let seasonNumbers: [Int]
    public let currentSeasonNumber: Int?
    public let displayManageRecordings: Bool

    init(tvSeriesId: SeriesId,
         numTotalEpisodes: Int,
         numAvailableEpisodes: Int,
         numFutureEpisodes: Int,
         isSeriesRecordingEligible: Bool,
         isSeriesRecordingActive: Bool,
         title: String,
         cid: ChannelId,
         imageToken: String,
         sortings: [SeriesSorting],
         currentSorting: String?,
         programs: [Program],
         seasonNumbers: [Int],
         currentSeasonNumber: Int?,
         displayManageRecordings: Bool) {

        self.tvSeriesId = tvSeriesId
        self.numTotalEpisodes = numTotalEpisodes
        self.numAvailableEpisodes = numAvailableEpisodes
        self.numFutureEpisodes = numFutureEpisodes
        self.isSeriesRecordingEligible = isSeriesRecordingEligible
        self.isSeriesRecordingActive = isSeriesRecordingActive
        self.title = title
        self.cid = cid
        self.imageToken = imageToken
        self.sortings = sortings
        self.currentSorting = currentSorting
        self.programs = programs
        self.seasonNumbers = seasonNumbers
        self.currentSeasonNumber = currentSeasonNumber
        self.displayManageRecordings = displayManageRecordings
    }
}
