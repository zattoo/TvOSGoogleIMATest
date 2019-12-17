//
//  VodMovieModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 13.02.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodMovieModel: DTOConvertible {
    
    var DTO: VodMovie {
        return VodMovie(id: id,
                        imageToken: imageToken,
                        title: title,
                        originalTitle: originalTitle,
                        subtitle: subtitle,
                        movieDescription: movieDescription,
                        displayPrice: displayPrice,
                        credits: credits,
                        captionLanguages: captionLanguages.DTOs,
                        audioLanguages: audioLanguages.DTOs,
                        trailerToken: trailerToken,
                        reviewRating: reviewRating,
                        ageRating: ageRating,
                        year: year,
                        termsCatalog: termsCatalog.map { $0.DTO },
                        imageStyle: imageStyle.DTO,
                        duration: duration,
                        teasableType: teasableType.DTO,
                        ribbonText: ribbonText,
                        isPreview: isPreview,
                        releaseDate: releaseDate,
                        category: category,
                        genres: genres,
                        qualities: qualities,
                        hideUnlessWatchList: hideUnlessWatchList,
                        brand: brand?.DTO)
    }
}
