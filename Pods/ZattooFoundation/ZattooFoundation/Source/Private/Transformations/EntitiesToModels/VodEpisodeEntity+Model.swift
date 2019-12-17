//
//  VodEpisodeEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 24.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodEpisodeEntity {
    
    func model(vodSeries: VodSeriesEntity) -> VodEpisodeModel {
        return VodEpisodeModel(
            id: id,
            imageToken: imageToken,
            title: title,
            originalTitle: originalTitle,
            subtitle: subtitle,
            episodeDescription: episodeDescription,
            displayPrice: displayPrice,
            credits: credits,
            captionLanguages: captionLanguages.models,
            audioLanguages: audioLanguages.models,
            reviewRating: reviewRating,
            ageRating: ageRating,
            year: "\(year)",
            termsCatalog: termsCatalog.map({ $0.model }),
            duration: runtime * 60,
            ribbonText: ribbonText,
            isPreview: isPreview,
            releaseDate: releaseDate,
            category: category,
            genres: genres,
            number: number,
            teasableType: teasableType.model,
            imageStyle: imageStyle.model,
            seasonId: seasonId,
            seriesId: vodSeries.id,
            brand: brand?.model
        )
    }
}

extension Sequence where Iterator.Element == VodEpisodeEntity {

    func models(vodSeries: VodSeriesEntity) -> [VodEpisodeModel] {
        return map { $0.model(vodSeries: vodSeries) }
    }
}
