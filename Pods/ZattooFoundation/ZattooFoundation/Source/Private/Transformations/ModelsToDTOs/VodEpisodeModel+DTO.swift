//
//  VodEpisodeModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 25.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodEpisodeModel: DTOConvertible {
    
    var DTO: VodEpisode {
        return VodEpisode(
            id: id,
            imageToken: imageToken,
            title: title,
            originalTitle: originalTitle,
            subtitle: subtitle,
            episodeDescription: episodeDescription,
            displayPrice: displayPrice,
            credits: credits,
            captionLanguages: captionLanguages.DTOs,
            audioLanguages: audioLanguages.DTOs,
            reviewRating: reviewRating,
            ageRating: ageRating,
            year: year,
            termsCatalog: termsCatalog.map { $0.DTO },
            duration: duration,
            ribbonText: ribbonText,
            isPreview: isPreview,
            releaseDate: releaseDate,
            category: category,
            genres: genres,
            number: number,
            teasableType: teasableType.DTO,
            imageStyle: imageStyle.DTO,
            seasonId: seasonId,
            seriesId: seriesId,
            brand: brand?.DTO
        )
    }
}

extension Sequence where Iterator.Element == VodEpisodeModel {
    
    var DTOs: [VodEpisode] {
        return map { $0.DTO }
    }
}
