//
//  VodSeasonEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero on 24.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodSeasonEntity: Codable {
    let id: VodId
    let title: String
    let number: Int
    let captionLanguages: [LanguageEntity]
    let audioLanguages: [LanguageEntity]
    let displayPrice: String
    let isPreview: Bool
    let termsCatalog: [VodTermsCatalogEntity]
    let episodes: [VodEpisodeEntity]
    let releaseDate: Date?
    let year: Int
    let trailerToken: String?
    let reviewRating: Float
    let teasableType: TeasableTypeEntity
    let imageToken: String?
    let imageStyle: ImageStyleEntity
    let qualities: [String]
    let brand: BrandEntity?
}
