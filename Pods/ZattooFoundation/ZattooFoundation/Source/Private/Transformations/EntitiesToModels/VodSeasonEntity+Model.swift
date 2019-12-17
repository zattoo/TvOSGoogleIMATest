//
//  VodSeasonEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 24.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodSeasonEntity {
    
    func model(with vodSeries: VodSeriesEntity) -> VodSeasonModel {
        return VodSeasonModel(
            id: id,
            title: title,
            number: number,
            captionLanguages: captionLanguages.models,
            audioLanguages: audioLanguages.models,
            displayPrice: displayPrice,
            isPreview: isPreview,
            termsCatalog: termsCatalog.map({ $0.model }),
            episodes: episodes.models(vodSeries: vodSeries),
            releaseDate: releaseDate,
            year: "\(year)",
            trailerToken: trailerToken,
            reviewRating: reviewRating,
            teasableType: teasableType.model,
            imageToken: imageToken,
            imageStyle: imageStyle.model,
            seasonDescription: vodSeries.seriesDescription,
            credits: vodSeries.credits,
            genres: vodSeries.genres,
            ageRating: vodSeries.ageRating,
            seriesId: vodSeries.id,
            qualities: qualities,
            brand: brand?.model
        )
    }
}
