//
//  EditorialNavigationContextModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 28.10.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension EditorialNavigationContextModel: DTOConvertible {
    
    var DTO: EditorialNavigationContext {
        switch self {
        case .channels:
            return .channels
        case .recordings:
            return .recordings
        case .start:
            return .start
        case .vod:
            return .vod
        }
    }
}
