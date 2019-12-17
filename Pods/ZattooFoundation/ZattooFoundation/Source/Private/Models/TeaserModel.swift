//
//  TeaserModel.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/26/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct TeaserModel {
    let teaserId: TeasableId
    let title: String?
    let teasableType: TeasableTypeModel
    let teasable: Any?
    let text: String?
    let imageToken: String?
    let url: URL?
}

enum TeasableTypeModel {
    case generic
    case tvBroadcast
    case tvMetaChannel
    case tvSeries
    case editorialPage
    case editorialTeaserCollection
    case avodVideo
    case avodSeries
    case vodMovie
    case vodSeries
    case vodEpisode
    case vodSeason
}
