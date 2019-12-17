//
//  PageElementContentEntity+Model.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension PageElementContentEntity: ModelConvertible {
    
    var model: PageElementContentModel {
        return PageElementContentModel(style: style.model,
                                       perPage: perPage,
                                       publicId: publicId)
    }
}

extension PageElementStyleEntity: ModelConvertible {
    
    var model: PageElementStyleModel {
        switch self {
        case .generic:
            return .generic
        case .marquee:
            return .marquee
        case .carousel:
            return .carousel
        case .channelCarousel:
            return .channelCarousel
        case .subNavigation:
            return .subNavigation
        }
    }
}
