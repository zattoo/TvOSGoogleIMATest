//
//  AudioChannelModel+DTO.swift
//  ZattooFoundation
//
//  Created by Abraham Tomas Diaz Abreu on 30.06.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension AudioChannelModel: DTOConvertible {
    
    var DTO: AudioChannel {
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
