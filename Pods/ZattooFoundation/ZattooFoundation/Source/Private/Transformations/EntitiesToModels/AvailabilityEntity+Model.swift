//
//  AvailabilityEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/10/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension AvailabilityEntity: ModelConvertible {
    
    var model: AvailabilityModel {
        switch self {
        case .available:
            return .available
        case .needs_internal_network:
            return .needs_internal_network
        case .needs_wifi:
            return .needs_wifi
        case .subscribable:
            return .subscribable
        }
    }
}
