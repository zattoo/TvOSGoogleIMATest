//
//  AvailabilityModel.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/10/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


enum AvailabilityModel {
    case available
    case subscribable
    case needs_wifi
    case needs_internal_network
    
    var priority: Int {
        switch self {
        case .available:
            return 0
        case .needs_internal_network:
            return 1
        case .needs_wifi:
            return 2
        case .subscribable:
            return 3
        }
    }
}
