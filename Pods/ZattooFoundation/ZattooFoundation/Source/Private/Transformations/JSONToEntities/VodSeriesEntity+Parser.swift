//
//  VodSeriesEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension VodSeriesEntity {
    
    init(json: JSON) {
        id = json["id"].stringValue
        imageToken = json["image_token"].string
        title = json["title"].stringValue
        originalTitle = json["original_title"].stringValue
        subtitle = json["subtitle"].string
        seriesDescription = json["description"].stringValue
        credits = json["credits"].creditsValue
        ageRating = json["age_rating"].string
        imageStyle = json["image_style"].imageStyleEntityValue
        teasableType = json["type"].teasableTypeEntityValue
        ribbonText = json["ribbon"].string
        category = json["category"].string
        genres = json["genres"].array?.map { $0.stringValue }
        currentSeason = VodSeasonEntity(json: json["current_season"])
        allSeasons = json["seasons"].arrayValue.compactMap { VodSeasonReferenceEntity(json: $0) }
        productionYears = json["production_years"].stringValue
        hideUnlessWatchList = json["hide_unless_watchlist"].boolValue
        brand = BrandEntity(json: json["brand"])
    }
}
