//
//  VodSeriesEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 24.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodSeriesEntity: ModelConvertible {
    
    var model: VodSeriesModel {
        return VodSeriesModel(
            id: id,
            imageToken: imageToken,
            title: title,
            originalTitle: originalTitle,
            subtitle: subtitle,
            seriesDescription: seriesDescription,
            credits: credits,
            ageRating: ageRating,
            imageStyle: imageStyle.model,
            teasableType: teasableType.model,
            ribbonText: ribbonText,
            category: category,
            genres: genres,
            currentSeason: currentSeason.model(with: self),
            allSeasons: allSeasons.models,
            productionYears: productionYears,
            hideUnlessWatchList: hideUnlessWatchList,
            brand: brand?.model
        )
    }
}
