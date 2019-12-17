//
//  VodSeason.swift
//  ZattooFoundation
//
//  Created by David Cordero on 25.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


@objcMembers
final public class VodSeason: NSObject, Teasable {
    public let id: VodId
    public let title: String
    public let number: Int
    public let captionLanguages: [Language]
    public let audioLanguages: [Language]
    public let displayPrice: String
    public let isPreview: Bool
    public let termsCatalog: [VodTermsCatalog]
    public let episodes: [VodEpisode]
    public let releaseDate: Date?
    public let year: String
    public let trailerToken: String?
    public let reviewRating: Float
    public let teasableType: TeasableType
    public let imageToken: String?
    public let imageStyle: ImageStyle
    public let seasonDescription: String
    public let credits: Credits
    public let genres: [String]?
    public let ageRating: String?
    public let seriesId: VodSeriesId
    public let qualities: [String]
    public let brand: Brand?
    
    init(id: VodId, title: String, number: Int, captionLanguages: [Language], audioLanguages: [Language], displayPrice: String, isPreview: Bool, termsCatalog: [VodTermsCatalog], episodes: [VodEpisode], releaseDate: Date?, year: String, trailerToken: String?, reviewRating: Float, teasableType: TeasableType, imageToken: String?, imageStyle: ImageStyle, seasonDescription: String, credits: Credits, genres: [String]?, ageRating: String?, seriesId: VodSeriesId, qualities: [String], brand: Brand?) {
        self.id = id
        self.title = title
        self.number = number
        self.captionLanguages = captionLanguages
        self.audioLanguages = audioLanguages
        self.displayPrice = displayPrice
        self.isPreview = isPreview
        self.termsCatalog = termsCatalog
        self.episodes = episodes
        self.releaseDate = releaseDate
        self.year = year
        self.trailerToken = trailerToken
        self.reviewRating = reviewRating
        self.teasableType = teasableType
        self.imageToken = imageToken
        self.imageStyle = imageStyle
        self.seasonDescription = seasonDescription
        self.credits = credits
        self.genres = genres
        self.ageRating = ageRating
        self.seriesId = seriesId
        self.qualities = qualities
        self.brand = brand
    }
}
