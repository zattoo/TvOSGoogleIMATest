//
//  VodEpisodeModel.swift
//  ZattooFoundation
//
//  Created by David Cordero on 24.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodEpisodeModel {
    let id: VodId
    let imageToken: String?
    let title: String
    let originalTitle: String
    let subtitle: String?
    let episodeDescription: String
    let displayPrice: String
    let credits: Credits
    let captionLanguages: [LanguageModel]
    let audioLanguages: [LanguageModel]
    let reviewRating: Float
    let ageRating: String?
    let year: String
    let termsCatalog: [VodTermsCatalogModel]
    let duration: TimeInterval
    let ribbonText: String?
    let isPreview: Bool
    let releaseDate: Date?
    let category: String?
    let genres: [String]?
    let number: Int
    let teasableType: TeasableTypeModel
    let imageStyle: ImageStyleModel
    let seasonId: VodId
    let seriesId: VodSeriesId
    let brand: BrandModel?
}
