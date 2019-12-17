//
//  AvodVideo.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 7/11/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


public typealias VodToken = String

@objc(ZattooFoundationAvodVideo)
final public class AvodVideo: NSObject, Teasable {
    
    public struct Series {
        public let id: Int
        public let title: String
        public let seriesId: SeriesId?
    }
    
    public let series: Series?
    public let brand: Brand?
    public let categories: [String]
    public let countries: String?
    public let avodVideoDescription: String?
    public let duration: Int
    public let credits: Credits
    public let episodeNumber: Int?
    public let genres: [String]
    public let imageToken: String?
    public let publishedUntil: Date?
    public let seasonNumber: Int?
    public let subtitle: String?
    public let title: String?
    public let token: VodToken
    public let year: Int?
    public let drmRequired: Bool
    public let streamTypes: [String]
    
    init(series: Series?,
         brand: Brand?,
         categories: [String],
         countries: String?,
         avodVideoDescription: String?,
         duration: Int,
         credits: Credits,
         episodeNumber: Int?,
         genres: [String],
         imageToken: String?,
         publishedUntil: Date?,
         seasonNumber: Int?,
         subtitle: String?,
         title: String?,
         token: VodToken,
         year: Int?,
         drmRequired: Bool,
         streamTypes: [String]) {
        
        self.series = series
        self.brand = brand
        self.categories = categories
        self.countries = countries
        self.avodVideoDescription = avodVideoDescription
        self.duration = duration
        self.credits = credits
        self.episodeNumber = episodeNumber
        self.genres = genres
        self.imageToken = imageToken
        self.publishedUntil = publishedUntil
        self.seasonNumber = seasonNumber
        self.subtitle = subtitle
        self.title = title
        self.token = token
        self.year = year
        self.drmRequired = drmRequired
        self.streamTypes = streamTypes
    }
}
