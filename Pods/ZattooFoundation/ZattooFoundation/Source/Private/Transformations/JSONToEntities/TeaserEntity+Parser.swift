//
//  TeaserEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/26/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension TeaserEntity {
    
    init(json: JSON) {
        teaserId = json["teasable_id"].stringValue
        title = json["title"].string
        teasableType = json["teasable_type"].teasableTypeEntityValue
        text = json["text"].string
        imageToken = json["image_token"].string
        url = json["url"].url

        switch teasableType {
        case .generic,
             .editorialPage,
             .editorialTeaserCollection,
             .avodSeries,
             .vodSeason,
             .vodEpisode:
            teasable = nil
            avodTeasable = nil
            seriesTeasable = nil
            vodMovieTeasable = nil
            vodSeriesTeasable = nil
        case .tvSeries:
            teasable = nil
            avodTeasable = nil
            vodMovieTeasable = nil
            vodSeriesTeasable = nil
            seriesTeasable = SeriesTeaserEntity(json: json["teasable"])
        case .avodVideo:
            teasable = nil
            avodTeasable = AvodVideoEntity(json: json["teasable"])
            seriesTeasable = nil
            vodMovieTeasable = nil
            vodSeriesTeasable = nil
        case .tvMetaChannel:
            teasable = ProgramEntity(json: json["teasable"]["now"])
            avodTeasable = nil
            seriesTeasable = nil
            vodMovieTeasable = nil
            vodSeriesTeasable = nil
        case .tvBroadcast:
            teasable = ProgramEntity(json: json["teasable"])
            avodTeasable = nil
            seriesTeasable = nil
            vodMovieTeasable = nil
            vodSeriesTeasable = nil
        case .vodMovie:
            teasable = nil
            avodTeasable = nil
            seriesTeasable = nil
            vodMovieTeasable = VodMovieEntity(json: json["teasable"])
            vodSeriesTeasable = nil
        case .vodSeries:
            teasable = nil
            avodTeasable = nil
            seriesTeasable = nil
            vodMovieTeasable = nil
            vodSeriesTeasable = VodSeriesEntity(json: json["teasable"])
        }
    }
}
