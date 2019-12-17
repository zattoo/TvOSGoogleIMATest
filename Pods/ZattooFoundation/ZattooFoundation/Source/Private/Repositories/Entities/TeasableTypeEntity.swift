//
//  TeasableTypeEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero on 21.05.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


enum TeasableTypeEntity: String, Codable {
    case generic = ""
    case tvBroadcast = "Tv::Broadcast"
    case tvMetaChannel = "Tv::MetaChannel"
    case tvSeries = "Tv::Series"
    case editorialPage = "Editorial::Page"
    case editorialTeaserCollection = "Editorial::TeaserCollection"
    case avodVideo = "Avod::Video"
    case avodSeries = "Avod::Series"
    case vodMovie = "Vod::Movie"
    case vodSeries = "Vod::Series"
    case vodEpisode = "Vod::Episode"
    case vodSeason = "Vod::Season"
}
