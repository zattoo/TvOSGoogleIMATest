//
//  VodSeasonModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 25.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodSeasonModel: DTOConvertible {
    
    var DTO: VodSeason {
        return VodSeason(
            id: id,
            title: title,
            number: number,
            captionLanguages: captionLanguages.DTOs,
            audioLanguages: audioLanguages.DTOs,
            displayPrice: displayPrice,
            isPreview: isPreview,
            termsCatalog: termsCatalog.map { $0.DTO },
            episodes: episodes.DTOs,
            releaseDate: releaseDate,
            year: year,
            trailerToken:
            trailerToken,
            reviewRating: reviewRating,
            teasableType: teasableType.DTO,
            imageToken: imageToken,
            imageStyle: imageStyle.DTO,
            seasonDescription: seasonDescription,
            credits: credits,
            genres: genres,
            ageRating: ageRating,
            seriesId: seriesId,
            qualities: qualities,
            brand: brand?.DTO
        )
    }
}
