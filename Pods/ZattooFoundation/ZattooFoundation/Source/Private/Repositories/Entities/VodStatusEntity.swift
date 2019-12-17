//
//  VodStatusEntity.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/22/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodStatusEntity: Codable {
    let isExpired: Bool
    let teasableId: TeasableId
    let teasableType: TeasableTypeEntity
    let orderId: Int
    let orderedAt: Date
    let orderedUntil: Date?
    let price: String
    let qualityLevel: QualityLevelEntity
    let termToken: String
    let title: String
    let videoToken: String
    let vodType: VodTypeEntity?
    let position: TimeInterval
    let isDrmRequired: Bool
    let isOrdered: Bool
}
