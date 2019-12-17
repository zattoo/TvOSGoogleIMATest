//
//  SeriesDetailsEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 17.10.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension SeriesDetailsEntity {

    init?(json: JSON?) {
        guard let json = json else { return nil }

        tvSeriesId = json["tv_series_id"].intValue
        numTotalEpisodes = json["total_episodes"].intValue
        numAvailableEpisodes = json["available_episodes"].intValue
        numFutureEpisodes = json["future_episodes"].intValue
        isSeriesRecordingEligible = json["series_recording_eligible"].boolValue
        isSeriesRecordingActive = json["series_recording_active"].boolValue
        title = json["title"].stringValue
        cid = json["cid"].stringValue
        imageToken = json["image_token"].stringValue
        sortings = json["sortings"].arrayValue.map { SortingEntity(json: $0) }
        currentSorting = json["current_sorting"].string
        programs = json["programs"].arrayValue.map { ProgramEntity(json: $0) }
        seasonNumbers = json["season_numbers"].arrayValue.map { $0.intValue }
        currentSeasonNumber = json["current_season_number"].int
        displayManageRecordings = json["display_manage_recordings"].boolValue
    }
}
