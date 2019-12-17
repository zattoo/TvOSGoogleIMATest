//
//  VodSeriesEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodSeriesEntity: Codable {
    let id: VodSeriesId
    let imageToken: String?
    let title: String
    let originalTitle: String
    let subtitle: String?
    let seriesDescription: String
    let credits: Credits
    let ageRating: String?
    let imageStyle: ImageStyleEntity
    let teasableType: TeasableTypeEntity
    let ribbonText: String?
    let category: String?
    let genres: [String]?
    let currentSeason: VodSeasonEntity
    let allSeasons: [VodSeasonReferenceEntity]
    let productionYears: String
    let hideUnlessWatchList: Bool
    let brand: BrandEntity?
}
