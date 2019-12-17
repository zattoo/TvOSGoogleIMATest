//
//  VodMovieEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero on 13.02.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodMovieEntity: Codable {
    let id: VodId
    let imageToken: String?
    let title: String
    let originalTitle: String
    let subtitle: String?
    let movieDescription: String
    let displayPrice: String
    let credits: Credits
    let captionLanguages: [LanguageEntity]
    let audioLanguages: [LanguageEntity]
    let trailerToken: String?
    let reviewRating: Float
    let ageRating: String?
    let year: Int
    let termsCatalog: [VodTermsCatalogEntity]
    let imageStyle: ImageStyleEntity
    let runtime: TimeInterval
    let teasableType: TeasableTypeEntity
    let ribbonText: String?
    let isPreview: Bool
    let releaseDate: Date?
    let category: String?
    let genres: [String]?
    let qualities: [String]
    let hideUnlessWatchList: Bool
    let brand: BrandEntity?
}
