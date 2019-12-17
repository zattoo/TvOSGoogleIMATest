//
//  AvailabilityEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/10/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


enum AvailabilityEntity: String, Codable {
    case available
    case subscribable
    case needs_wifi
    case needs_internal_network
}
