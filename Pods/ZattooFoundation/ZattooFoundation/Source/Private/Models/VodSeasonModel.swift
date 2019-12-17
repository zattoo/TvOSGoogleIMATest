//
//  VodSeasonModel.swift
//  ZattooFoundation
//
//  Created by David Cordero on 24.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation

struct VodSeasonModel {
    let id: VodId
    let title: String
    let number: Int
    let captionLanguages: [LanguageModel]
    let audioLanguages: [LanguageModel]
    let displayPrice: String
    let isPreview: Bool
    let termsCatalog: [VodTermsCatalogModel]
    let episodes: [VodEpisodeModel]
    let releaseDate: Date?
    let year: String
    let trailerToken: String?
    let reviewRating: Float
    let teasableType: TeasableTypeModel
    let imageToken: String?
    let imageStyle: ImageStyleModel
    let seasonDescription: String
    let credits: Credits
    let genres: [String]?
    let ageRating: String?
    let seriesId: VodSeriesId
    let qualities: [String]
    let brand: BrandModel?
}
