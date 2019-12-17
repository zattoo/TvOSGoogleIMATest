//
//  PageElementContentTypeEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero on 29.07.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


enum PageElementContentTypeEntity: String, Codable {
    case teaserCollection = "Editorial::TeaserCollection"
    case subnavigation = "Editorial::SubNavigation"
    case notSupported
}
