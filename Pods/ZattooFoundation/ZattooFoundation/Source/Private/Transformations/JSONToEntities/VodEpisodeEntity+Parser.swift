//
//  VodEpisodeEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero on 24.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension VodEpisodeEntity {
    
    init(json: JSON) {
        id = json["id"].stringValue
        imageToken = json["image_token"].string
        title = json["title"].stringValue
        originalTitle = json["original_title"].stringValue
        subtitle = json["subtitle"].string
        episodeDescription = json["description"].stringValue
        displayPrice = json["display_price"].stringValue
        credits = json["credits"].creditsValue
        captionLanguages = json["video_caption_languages"].arrayValue.map { LanguageEntity(json: $0) }
        audioLanguages = json["video_audio_languages"].arrayValue.map { LanguageEntity(json: $0) }
        reviewRating = json["review_rating"].floatValue
        ageRating = json["age_rating"].string
        year = json["year"].intValue
        termsCatalog = json["terms_catalog"].arrayValue.compactMap { VodTermsCatalogEntity(json: $0) }
        runtime = json["runtime"].doubleValue
        ribbonText = json["ribbon"].string
        isPreview = json["preview"].boolValue
        category = json["category"].string
        genres = json["genres"].array?.map { $0.stringValue }
        number = json["number"].intValue
        teasableType = json["type"].teasableTypeEntityValue

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        releaseDate = dateFormatter.date(from: json["release_date"].stringValue)
        imageStyle = json["image_style"].imageStyleEntityValue
        seasonId = json["season_id"].stringValue
        brand = BrandEntity(json: json["brand"])
    }
}
