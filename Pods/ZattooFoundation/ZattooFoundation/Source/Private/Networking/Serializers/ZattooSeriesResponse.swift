//
//  ZattooSeriesResponse.swift
//  ZattooFoundation
//
//  Created by Abraham Tomás Díaz Abreu on 24/10/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooSeriesResponse: SwiftyJsonResponseSerializable {
    let series: SeriesEntity
    let recording: RecordingEntity
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init?(json: JSON) {
        guard json["success"].boolValue else { return nil }

        guard let seriesEntity = SeriesEntity(json: json["series"]) else {
            return nil
        }
        
        series = seriesEntity
        recording = RecordingEntity(json: json["recording"])
    }
}
