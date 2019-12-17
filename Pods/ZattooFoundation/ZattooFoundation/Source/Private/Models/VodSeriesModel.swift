//
//  VodSeriesModel.swift
//  ZattooFoundation
//
//  Created by David Cordero on 24.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodSeriesModel {
    let id: VodSeriesId
    let imageToken: String?
    let title: String
    let originalTitle: String
    let subtitle: String?
    let seriesDescription: String
    let credits: Credits
    let ageRating: String?
    let imageStyle: ImageStyleModel
    let teasableType: TeasableTypeModel
    let ribbonText: String?
    let category: String?
    let genres: [String]?
    let currentSeason: VodSeasonModel
    let allSeasons: [VodSeasonReferenceModel]
    let productionYears: String
    let hideUnlessWatchList: Bool
    let brand: BrandModel?
}
