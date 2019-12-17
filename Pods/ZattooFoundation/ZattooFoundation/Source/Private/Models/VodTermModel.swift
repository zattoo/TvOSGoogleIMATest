//
//  VodTermModel.swift
//  ZattooFoundation
//
//  Created by David Cordero on 14.02.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodTermModel {
    let isDrmRequired: Bool
    let quality: QualityLevelModel
    let price: String
    let vodType: VodTypeModel
    let videoToken: String
    let token: String
    let publishedUntil: Date
    let publishedFrom: Date
    let rentalPeriodInSeconds: Int
    let subscriptionSku: String?
    let subscriptionName: String?
}
