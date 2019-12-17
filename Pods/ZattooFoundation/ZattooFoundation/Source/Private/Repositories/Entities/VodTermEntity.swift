//
//  VodTermEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero on 14.02.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodTermEntity: Codable {
    let isDrmRequired: Bool
    let quality: QualityLevelEntity
    let price: String
    let vodType: VodTypeEntity
    let videoToken: String
    let token: String
    let publishedUntil: Date
    let publishedFrom: Date
    let rentalPeriodInSeconds: Int
    let subscriptionSku: String?
    let subscriptionName: String?
}
