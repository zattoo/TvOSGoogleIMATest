//
//  VodSeries.swift
//  ZattooFoundation
//
//  Created by David Cordero on 25.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


public typealias VodSeriesId = String

@objcMembers
final public class VodSeries: NSObject, Teasable {
    public let id: VodSeriesId
    public let imageToken: String?
    public let title: String
    public let originalTitle: String
    public let subtitle: String?
    public let seriesDescription: String
    public let credits: Credits
    public let ageRating: String?
    public let imageStyle: ImageStyle
    public let teasableType: TeasableType
    public let ribbonText: String?
    public let category: String?
    public let genres: [String]?
    public let currentSeason: VodSeason
    public let allSeasons: [VodSeasonReference]
    public let productionYears: String
    public let hideUnlessWatchList: Bool
    public let brand: Brand?
    
    init(id: VodSeriesId, imageToken: String?, title: String, originalTitle: String, subtitle: String?, seriesDescription: String, credits: Credits, ageRating: String?, imageStyle: ImageStyle, teasableType: TeasableType, ribbonText: String?, category: String?, genres: [String]?, currentSeason: VodSeason, allSeasons: [VodSeasonReference], productionYears: String, hideUnlessWatchList: Bool, brand: Brand?) {

        self.id = id
        self.imageToken = imageToken
        self.title = title
        self.originalTitle = originalTitle
        self.subtitle = subtitle
        self.seriesDescription = seriesDescription
        self.credits = credits
        self.ageRating = ageRating
        self.imageStyle = imageStyle
        self.teasableType = teasableType
        self.ribbonText = ribbonText
        self.category = category
        self.genres = genres
        self.currentSeason = currentSeason
        self.allSeasons = allSeasons
        self.productionYears = productionYears
        self.hideUnlessWatchList = hideUnlessWatchList
        self.brand = brand
    }
}
