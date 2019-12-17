//
//  VodSeasonEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero on 24.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension VodSeasonEntity {
    
    init(json: JSON) {
        id = json["id"].stringValue
        title = json["title"].stringValue
        number = json["number"].intValue
        captionLanguages = json["video_caption_languages"].arrayValue.map { LanguageEntity(json: $0) }
        audioLanguages = json["video_audio_languages"].arrayValue.map { LanguageEntity(json: $0) }
        displayPrice = json["display_price"].stringValue
        isPreview = json["preview"].boolValue
        termsCatalog = json["terms_catalog"].arrayValue.compactMap { VodTermsCatalogEntity(json: $0) }
        episodes = json["episodes"].arrayValue.compactMap {
            VodEpisodeEntity(json: $0)
        }
        
        trailerToken = json["trailer_token"].string
        reviewRating = json["review_rating"].floatValue
        year = json["year"].intValue
        teasableType = json["type"].teasableTypeEntityValue

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        releaseDate = dateFormatter.date(from: json["release_date"].stringValue)
        imageToken = json["image_token"].string
        imageStyle = json["image_style"].imageStyleEntityValue
        qualities = json["qualities"].arrayValue.compactMap { $0.stringValue.uppercased() }
        brand = BrandEntity(json: json["brand"])
    }
}
