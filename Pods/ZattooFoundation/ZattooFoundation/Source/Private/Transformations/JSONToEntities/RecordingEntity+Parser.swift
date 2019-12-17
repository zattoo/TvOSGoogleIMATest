//
//  RecordingEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero on 18/08/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension RecordingEntity {
    
    init(json: JSON) {
        id = json["id"].intValue
        cid = json["cid"].stringValue
        title = json["title"].stringValue
        episodeTitle = json["episode_title"].string
        start = json["start"].dateValue
        end = json["end"].dateValue
        programId = json["program_id"].intValue
        lastPosition = json["position"].dateValue.timeIntervalSince(start)
        isPartial = json["partial"].boolValue
        imageToken = json["image_token"].string
        isSeriesRecordingEligible = json["series_recording_eligible"].boolValue
        tvSeriesId = json["tv_series_id"].int
        
        if let qualityLevelString = json["level"].string, 
            let qualityLevel = QualityLevelEntity(rawValue: qualityLevelString) {
            self.qualityLevel = qualityLevel
        }
        else {
            qualityLevel = .sd
        }
        
        isRestrictedQuality = json["restricted_quality"].boolValue
        expiration = json["expiration"].date
    }
}
