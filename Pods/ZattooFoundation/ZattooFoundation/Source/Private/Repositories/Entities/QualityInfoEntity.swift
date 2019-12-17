//
//  QualityInfoEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 4/20/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct QualityInfoEntity: Codable {
    
    let availabilityEntity: AvailabilityEntity
    let qualityLevelEntity: QualityLevelEntity
    let logoToken: String?
    let title: String
    let streamTypes: [String]
    let drmRequired: Bool
}
