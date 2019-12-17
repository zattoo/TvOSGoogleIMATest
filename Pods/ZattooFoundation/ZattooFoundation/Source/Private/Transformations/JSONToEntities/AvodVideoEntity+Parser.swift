//
//  AvodVideoEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 7/8/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension AvodVideoEntity {
    
    init?(json: JSON) {
        guard let token = json["token"].string else {
            return nil
        }
        
        self.token = token
        
        let avodSeries = json["avod_series"]
        if !(avodSeries.rawValue is NSNull) {
            let id = avodSeries["id"].intValue
            let title = avodSeries["title"].stringValue
            let seriesId = avodSeries["tv_series_id"].int
            series = AvodVideoEntity.SeriesEntity(id: id, title: title, seriesId: seriesId)
        } else {
            series = nil
        }
        
        brand = BrandEntity(json: json["brand"])
        categories = json["categories"].transformEachElement { $0.string }
        countries = json["countries"].string
        description = json["description"].string
        duration = json["duration"].intValue
        credits = json["credits"].creditsValue
        episodeNumber = json["episode_number"].int
        genres = json["genres"].transformEachElement { $0.string }
        imageToken = json["image_token"].string
        publishedUntil = json["published_until"].date
        seasonNumber = json["season_number"].int
        subtitle = json["subtitle"].string
        title = json["title"].string
        year = json["year"].int
        drmRequired = json["drm_required"].boolValue
        streamTypes = json["stream_types"].transformEachElement { $0.string }
    }
}
