//
//  AvodVideoEntity.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 7/7/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct AvodVideoEntity: Codable {
    
    struct SeriesEntity: Codable {
        let id: Int
        let title: String
        let seriesId: Int?
    }

    let series: SeriesEntity?
    let brand: BrandEntity?
    let categories: [String]
    let countries: String?
    let description: String?
    let duration: Int
    let credits: Credits
    let episodeNumber: Int?
    let genres: [String]
    let imageToken: String?
    let publishedUntil: Date?
    let seasonNumber: Int?
    let subtitle: String?
    let title: String?
    let token: String
    let year: Int?
    let drmRequired: Bool
    let streamTypes: [String]
}
