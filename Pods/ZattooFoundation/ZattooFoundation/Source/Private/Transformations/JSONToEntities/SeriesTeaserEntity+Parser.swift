//
//  SeriesTeaserEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 11/10/18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension SeriesTeaserEntity {
    
    init?(json: JSON?) {
        guard let json = json else { return nil }
        title = json["title"].stringValue
        tvSeriesId = json["tv_series_id"].intValue
        isSeriesRecordingEligible = json["series_recording_eligible"].boolValue
        imageToken = json["image_token"].stringValue
        cid = json["cid"].stringValue
        isRecordingsOnly = json["recordings_only"].boolValue
    }
}
