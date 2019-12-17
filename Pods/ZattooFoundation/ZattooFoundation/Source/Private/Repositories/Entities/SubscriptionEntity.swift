//
//  SubscriptionEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero on 16.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


struct SubscriptionEntity: Codable {

    let id: Int
    let expiration: Date?
    let isAutoRenewing: Bool
    let isExternalAutoRenewing: Bool
    let sku: String
    let serviceId: Int
}
