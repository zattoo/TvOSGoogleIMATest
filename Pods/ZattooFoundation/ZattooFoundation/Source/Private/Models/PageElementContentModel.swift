//
//  PageElementModel.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


struct PageElementContentModel {
    let style: PageElementStyleModel
    let perPage: Int
    let publicId: String
}

enum PageElementStyleModel: String {
    case generic
    case marquee
    case channelCarousel
    case carousel
    case subNavigation
}
