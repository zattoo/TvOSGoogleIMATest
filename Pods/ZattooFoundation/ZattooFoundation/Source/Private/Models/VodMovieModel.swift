//
//  VodMovieModel.swift
//  ZattooFoundation
//
//  Created by David Cordero on 13.02.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodMovieModel {
    let id: VodId
    let imageToken: String?
    let title: String
    let originalTitle: String
    let subtitle: String?
    let movieDescription: String
    let displayPrice: String
    let credits: Credits
    let captionLanguages: [LanguageModel]
    let audioLanguages: [LanguageModel]
    let trailerToken: String?
    let reviewRating: Float
    let ageRating: String?
    let year: String
    let termsCatalog: [VodTermsCatalogModel]
    let imageStyle: ImageStyleModel
    let duration: TimeInterval
    let teasableType: TeasableTypeModel
    let ribbonText: String?
    let isPreview: Bool
    let releaseDate: Date?
    let category: String?
    let genres: [String]?
    let qualities: [String]
    let hideUnlessWatchList: Bool
    let brand: BrandModel?
}
