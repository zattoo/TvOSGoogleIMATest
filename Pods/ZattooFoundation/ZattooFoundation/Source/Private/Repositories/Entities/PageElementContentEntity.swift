//
//  PageElementContentEntity.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


struct PageElementContentEntity: Codable {
    let style: PageElementStyleEntity
    let perPage: Int
    let publicId: String
}

enum PageElementStyleEntity: String, Codable {
    case generic = ""
    case marquee = "marquee"
    case channelCarousel = "channel_carousel"
    case carousel = "carousel"
    case subNavigation = "tab_navigation"
}
