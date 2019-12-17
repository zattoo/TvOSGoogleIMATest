//
//  Availability.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/10/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


public enum AvailabilityType {
    case available
    case subscribable
    case needs_wifi
    case needs_internal_network
}

final public class Availability: NSObject {
    
    public let type: AvailabilityType
    public let priority: Int
    
    init(type: AvailabilityType, priority: Int) {
        self.type = type
        self.priority = priority
    }
}
