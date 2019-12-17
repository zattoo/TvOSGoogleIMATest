//
//  PageElementContentModel.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension PageElementContentModel: DTOConvertible {
    
    var DTO: PageElementContent {
        return PageElementContent(style: style.DTO,
                                  perPage: perPage,
                                  publicId: publicId)
    }
}

extension PageElementStyleModel: DTOConvertible {
    
    var DTO: PageElementContentStyle {
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
