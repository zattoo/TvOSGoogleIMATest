//
//  VodMovieEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 13.02.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodMovieEntity: ModelConvertible {
    
    var model: VodMovieModel {
        return VodMovieModel(id: id,
                             imageToken: imageToken,
                             title: title,
                             originalTitle: originalTitle,
                             subtitle: subtitle,
                             movieDescription: movieDescription,
                             displayPrice: displayPrice,
                             credits: credits,
                             captionLanguages: captionLanguages.models,
                             audioLanguages: audioLanguages.models,
                             trailerToken: trailerToken,
                             reviewRating: reviewRating,
                             ageRating: ageRating,
                             year: "\(year)",
                             termsCatalog: termsCatalog.map({ $0.model }),
                             imageStyle: imageStyle.model,
                             duration: runtime * 60,
                             teasableType: teasableType.model,
                             ribbonText: ribbonText,
                             isPreview: isPreview,
                             releaseDate: releaseDate,
                             category: category,
                             genres: genres,
                             qualities: qualities,
                             hideUnlessWatchList: hideUnlessWatchList,
                             brand: brand?.model)
    }
}
