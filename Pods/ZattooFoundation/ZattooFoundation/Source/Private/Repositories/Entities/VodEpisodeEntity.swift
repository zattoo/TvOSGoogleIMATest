//
//  VodEpisode.swift
//  ZattooFoundation
//
//  Created by David Cordero on 24.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodEpisodeEntity: Codable {
    let id: VodId
    let imageToken: String?
    let title: String
    let originalTitle: String
    let subtitle: String?
    let episodeDescription: String
    let displayPrice: String
    let credits: Credits
    let captionLanguages: [LanguageEntity]
    let audioLanguages: [LanguageEntity]
    let reviewRating: Float
    let ageRating: String?
    let year: Int
    let termsCatalog: [VodTermsCatalogEntity]
    let runtime: TimeInterval
    let ribbonText: String?
    let isPreview: Bool
    let releaseDate: Date?
    let category: String?
    let genres: [String]?
    let number: Int
    let teasableType: TeasableTypeEntity
    let imageStyle: ImageStyleEntity
    let seasonId: VodId
    let brand: BrandEntity?
}
