//
//  AvailabilityModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/10/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension AvailabilityModel: DTOConvertible {
    
    var DTO: Availability {
        switch self {
        case .available:
            return Availability(type: .available, priority: self.priority)
        case .needs_internal_network:
            return Availability(type: .needs_internal_network, priority: self.priority)
        case .needs_wifi:
            return Availability(type: .needs_wifi, priority: self.priority)
        case .subscribable:
            return Availability(type: .subscribable, priority: self.priority)
        }
    }
}
