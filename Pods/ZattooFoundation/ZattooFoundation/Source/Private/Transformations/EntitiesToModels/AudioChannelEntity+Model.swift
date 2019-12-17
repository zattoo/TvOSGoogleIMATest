//
//  AudioChannelEntity+Model.swift
//  ZattooFoundation
//
//  Created by Abraham Tomas Diaz Abreu on 30.06.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension AudioChannelEntity: ModelConvertible {
    
    var model: AudioChannelModel {
        switch self {
        case .a:
            return .a
        case .b:
            return .b
        default:
            return .unknown
        }
    }
}
