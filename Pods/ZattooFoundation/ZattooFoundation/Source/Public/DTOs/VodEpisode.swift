//
//  VodEpisode.swift
//  ZattooFoundation
//
//  Created by David Cordero on 25.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


@objcMembers
final public class VodEpisode: NSObject, Teasable {
    public let id: VodId
    public let imageToken: String?
    public let title: String
    public let originalTitle: String
    public let subtitle: String?
    public let episodeDescription: String
    public let displayPrice: String
    public let credits: Credits
    public let captionLanguages: [Language]
    public let audioLanguages: [Language]
    public let reviewRating: Float
    public let ageRating: String?
    public let year: String
    public let termsCatalog: [VodTermsCatalog]
    public let duration: TimeInterval
    public let ribbonText: String?
    public let isPreview: Bool
    public let releaseDate: Date?
    public let category: String?
    public let genres: [String]?
    public let number: Int
    public let teasableType: TeasableType
    public let imageStyle: ImageStyle
    public let seasonId: VodId
    public let seriesId: VodSeriesId
    public let brand: Brand?
    
    init(id: VodId, imageToken: String?, title: String, originalTitle: String, subtitle: String?, episodeDescription: String, displayPrice: String, credits: Credits, captionLanguages: [Language], audioLanguages: [Language], reviewRating: Float, ageRating: String?, year: String, termsCatalog: [VodTermsCatalog], duration: TimeInterval, ribbonText: String?, isPreview: Bool, releaseDate: Date?, category: String?, genres: [String]?, number: Int, teasableType: TeasableType, imageStyle: ImageStyle, seasonId: VodId, seriesId: VodSeriesId, brand: Brand?) {
        
        self.id = id
        self.imageToken = imageToken
        self.title = title
        self.originalTitle = originalTitle
        self.subtitle = subtitle
        self.episodeDescription = episodeDescription
        self.displayPrice = displayPrice
        self.credits = credits
        self.captionLanguages = captionLanguages
        self.audioLanguages = audioLanguages
        self.reviewRating = reviewRating
        self.ageRating = ageRating
        self.year = year
        self.termsCatalog = termsCatalog
        self.duration = duration
        self.ribbonText = ribbonText
        self.isPreview = isPreview
        self.releaseDate = releaseDate
        self.category = category
        self.genres = genres
        self.number = number
        self.teasableType = teasableType
        self.imageStyle = imageStyle
        self.seasonId = seasonId
        self.seriesId = seriesId
        self.brand = brand
    }
}
