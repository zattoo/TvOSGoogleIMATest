//
//  EditorialNavigationContextEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 28.10.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension EditorialNavigationContextEntity: ModelConvertible {
    
    var model: EditorialNavigationContextModel {
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
