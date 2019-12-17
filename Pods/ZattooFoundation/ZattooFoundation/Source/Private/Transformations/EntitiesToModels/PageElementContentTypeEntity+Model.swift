//
//  PageElementContentTypeEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 29.07.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension PageElementContentTypeEntity: ModelConvertible {
    
    var model: PageElementContentTypeModel {
        switch self {
        case .teaserCollection:
            return .teaserCollection
        case .subnavigation:
            return .subnavigation
        case .notSupported:
            return .notSupported
        }
    }
}
