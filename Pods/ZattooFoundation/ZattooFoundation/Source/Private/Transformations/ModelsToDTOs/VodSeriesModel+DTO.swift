//
//  VodSeriesModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 25.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodSeriesModel: DTOConvertible {
    
    var DTO: VodSeries {
        return VodSeries(
            id: id,
            imageToken: imageToken,
            title: title,
            originalTitle: originalTitle,
            subtitle: subtitle,
            seriesDescription: seriesDescription,
            credits: credits,
            ageRating: ageRating,
            imageStyle: imageStyle.DTO,
            teasableType: teasableType.DTO,
            ribbonText: ribbonText,
            category: category,
            genres: genres,
            currentSeason: currentSeason.DTO,
            allSeasons: allSeasons.DTOs,
            productionYears: productionYears,
            hideUnlessWatchList: hideUnlessWatchList,
            brand: brand?.DTO
        )
    }
}
