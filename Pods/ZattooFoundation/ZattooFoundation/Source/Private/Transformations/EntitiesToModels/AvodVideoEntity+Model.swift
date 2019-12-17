//
//  AvodVideoEntity+Model.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 7/11/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension AvodVideoEntity: ModelConvertible {
    
    var model: AvodVideoModel {
        var series: AvodVideoModel.SeriesModel? = nil
        if let seriesEntity = self.series {
            let seriesId = seriesEntity.seriesId != nil ? NSNumber(value: seriesEntity.seriesId!) : nil
            series = AvodVideoModel.SeriesModel(id: seriesEntity.id,
                                           title: seriesEntity.title,
                                           seriesId: seriesId)
            
        }
        
        return AvodVideoModel(series: series,
                              brand: brand?.model,
                              categories: categories,
                              countries: countries,
                              description: description,
                              duration: duration,
                              credits: credits,
                              episodeNumber: episodeNumber,
                              genres: genres,
                              imageToken: imageToken,
                              publishedUntil: publishedUntil,
                              seasonNumber: seasonNumber,
                              subtitle: subtitle,
                              title: title,
                              token: token,
                              year: year,
                              drmRequired: drmRequired,
                              streamTypes: streamTypes)
    }
}

extension Sequence where Iterator.Element == AvodVideoEntity {
    
    var models: [AvodVideoModel] {
        return map { $0.model }
    }
}
