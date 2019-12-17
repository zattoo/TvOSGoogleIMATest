//
//  PageStyleEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 10.10.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension PageStyleEntity: ModelConvertible {
    
    var model: PageStyleModel {
        switch self {
        case .stackedElements:
            return .stackedElements
        case .selectableElements:
            return .selectableElements
        case .onlyFirstElement:
            return .onlyFirstElement
        }
    }
}
