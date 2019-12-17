//
//  ProgramEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/29/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension ProgramEntity {
    
    init(json: JSON) {
        id = json["id"].intValue
        title = json["t"].stringValue
        start = json["s"].dateValue
        end = json["e"].dateValue
        episodeTitle = json["et"].string
        imageToken = json["i_t"].string
        isBlackout = json["bo"].boolValue
        categories = json["c"].arrayValue.map { $0.stringValue }
        genres = json["g"].arrayValue.map { $0.stringValue }
        selectiveRecallUntil = json["sr_u"].date
        description = json["d"].string
        credits = json["cr"].creditsValue
        country = json["country"].string
        channelName = json["channel_name"].string
        cid = json["cid"].string
        
        if let year = json["year"].int {
            self.year = String(year)
        }
        else {
            self.year = nil
        }
        tvSeriesId = json["ts_id"].int
        isSeriesRecordingEligible = json["ser_e"].boolValue
        isRecordingEligible = json["r_e"].boolValue
        shouldContinueWatching = json["cw"].bool
        episodeNumber = json["e_no"].int
        seasonNumber = json["s_no"].int
        hideUnlessRecording = json["hide_unless_recording"].boolValue
    }
    
    init(searchJson: JSON) {
        id = searchJson["id"].intValue
        title = searchJson["title"].stringValue
        start = searchJson["start"].dateValue
        end = searchJson["end"].dateValue
        episodeTitle = searchJson["episode_title"].string
        imageToken = searchJson["image_token"].string
        isBlackout = searchJson["black_out"].boolValue
        categories = searchJson["categories"].arrayValue.map { $0.stringValue }
        genres = searchJson["genres"].arrayValue.map { $0.stringValue }
        selectiveRecallUntil = searchJson["selective_recall_until"].date
        description = searchJson["description"].string
        credits = searchJson["credits"].creditsValue
        country = searchJson["country"].string
        channelName = searchJson["channel_name"].string
        cid = searchJson["cid"].string
        
        if let year = searchJson["year"].int {
            self.year = String(year)
        }
        else {
            self.year = nil
        }
        tvSeriesId = searchJson["tv_series_id"].int
        isSeriesRecordingEligible = searchJson["series_recording_eligible"].boolValue
        isRecordingEligible = searchJson["recording_eligible"].boolValue
        shouldContinueWatching = searchJson["cw"].bool
        episodeNumber = searchJson["e_no"].int
        seasonNumber = searchJson["s_no"].int
        hideUnlessRecording = searchJson["hide_unless_recording"].boolValue
    }
}

func toProgramEntity(json: JSON) -> ProgramEntity? {
    return ProgramEntity(json: json)
}

func toProgramEntityFromSearch(json: JSON) -> ProgramEntity? {
    return ProgramEntity(searchJson: json)
}
