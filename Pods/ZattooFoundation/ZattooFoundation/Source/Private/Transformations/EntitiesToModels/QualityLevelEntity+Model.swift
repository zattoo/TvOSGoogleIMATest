//
//  QualityLevelEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/1/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension QualityLevelEntity: ModelConvertible {
    
    var model: QualityLevelModel {
        switch self {
        case .sd:
            return .sd
        case .hd:
            return .hd
        case .uhd:
            return .uhd
        }
    }
}
