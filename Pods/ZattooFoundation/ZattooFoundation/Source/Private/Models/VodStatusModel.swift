//
//  VodStatusModel.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/25/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodStatusModel {
    let isExpired: Bool
    let teasableId: TeasableId
    let teasableType: TeasableTypeModel
    let orderId: Int
    let orderedAt: Date
    let orderedUntil: Date?
    let price: String
    let qualityLevel: QualityLevelModel
    let termToken: String
    let title: String
    let videoToken: String
    let vodType: VodTypeModel?
    let lastPosition: TimeInterval
    let isDrmRequired: Bool
    let isOrdered: Bool
}
