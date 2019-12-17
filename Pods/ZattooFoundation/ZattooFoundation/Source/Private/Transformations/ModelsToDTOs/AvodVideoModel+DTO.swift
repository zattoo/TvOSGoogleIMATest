//
//  AvodVideoModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 7/11/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension AvodVideoModel: DTOConvertible {
    
    var DTO: AvodVideo {
        var series: AvodVideo.Series? = nil
        if let seriesEntity = self.series {
            series = AvodVideo.Series(id: seriesEntity.id,
                                      title: seriesEntity.title,
                                      seriesId: seriesEntity.seriesId)
            
        }

        return AvodVideo(series: series,
                         brand: brand?.DTO,
                         categories: categories,
                         countries: countries,
                         avodVideoDescription: description,
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

extension Sequence where Iterator.Element == AvodVideoModel {
    
    var DTOs: [AvodVideo] {
        return map { $0.DTO }
    }
}
