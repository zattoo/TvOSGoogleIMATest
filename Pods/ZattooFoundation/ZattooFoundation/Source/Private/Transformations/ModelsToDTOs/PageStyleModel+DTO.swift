//
//  PageStyleModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 10.10.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension PageStyleModel: DTOConvertible {
    
    var DTO: PageStyle {
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
