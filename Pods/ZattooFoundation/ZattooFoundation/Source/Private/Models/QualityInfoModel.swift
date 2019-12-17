//
//  QualityInfoModel.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/15/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct QualityInfoModel {
    let availabilityModel: AvailabilityModel
    let logoToken: String?
    let title: String
    let streamTypes: [String]
    let drmRequired: Bool
    let qualityLevelModel: QualityLevelModel
    
    var isAvailable: Bool {
        #if os(tvOS)
            return availabilityModel == .available || availabilityModel == .needs_internal_network || availabilityModel == .needs_wifi
        #else
            return availabilityModel == .available || availabilityModel == .needs_internal_network
        #endif
    }
    
    var availabilityPriority: Int {
        return availabilityModel.priority
    }
}
