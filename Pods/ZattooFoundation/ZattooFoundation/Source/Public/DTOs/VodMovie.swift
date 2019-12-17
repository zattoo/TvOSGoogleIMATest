//
//  VodMovie.swift
//  ZattooFoundation
//
//  Created by David Cordero on 13.02.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


@objcMembers
final public class VodMovie: NSObject, Teasable {
    public let id: VodId
    public let imageToken: String?
    public let title: String
    public let originalTitle: String
    public let subtitle: String?
    public let movieDescription: String
    public let displayPrice: String
    public let credits: Credits
    public let captionLanguages: [Language]
    public let audioLanguages: [Language]
    public let trailerToken: String?
    public let reviewRating: Float
    public let ageRating: String?
    public let year: String
    public let termsCatalog: [VodTermsCatalog]
    public let imageStyle: ImageStyle
    public let duration: TimeInterval
    public let teasableType: TeasableType
    public let ribbonText: String?
    public let isPreview: Bool
    public let releaseDate: Date?
    public let category: String?
    public let genres: [String]?
    public let qualities: [String]
    public let hideUnlessWatchList: Bool
    public let brand: Brand?

    init(id: VodId, imageToken: String?, title: String, originalTitle: String, subtitle: String?, movieDescription: String, displayPrice: String, credits: Credits, captionLanguages: [Language], audioLanguages: [Language], trailerToken: String?, reviewRating: Float, ageRating: String?, year: String, termsCatalog: [VodTermsCatalog], imageStyle: ImageStyle, duration: TimeInterval, teasableType: TeasableType, ribbonText: String?, isPreview: Bool, releaseDate: Date?, category: String?, genres: [String]?, qualities: [String], hideUnlessWatchList: Bool, brand: Brand?) {
        self.id = id
        self.imageToken = imageToken
        self.title = title
        self.originalTitle = originalTitle
        self.subtitle = subtitle
        self.movieDescription = movieDescription
        self.displayPrice = displayPrice
        self.credits = credits
        self.captionLanguages = captionLanguages
        self.audioLanguages = audioLanguages
        self.trailerToken = trailerToken
        self.reviewRating = reviewRating
        self.ageRating = ageRating
        self.year = year
        self.termsCatalog = termsCatalog
        self.imageStyle = imageStyle
        self.duration = duration
        self.teasableType = teasableType
        self.ribbonText = ribbonText
        self.isPreview = isPreview
        self.releaseDate = releaseDate
        self.category = category
        self.genres = genres
        self.qualities = qualities
        self.hideUnlessWatchList = hideUnlessWatchList
        self.brand = brand
    }
}
