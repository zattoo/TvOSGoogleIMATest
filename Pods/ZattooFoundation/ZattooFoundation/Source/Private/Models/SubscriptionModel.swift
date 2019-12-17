//
//  SubscriptionModel.swift
//  ZattooFoundation
//
//  Created by David Cordero on 21.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//


import Foundation


struct SubscriptionModel {
    
    let id: Int
    let expiration: Date?
    let isAutoRenewing: Bool
    let isExternalAutoRenewing: Bool
    let sku: String
    let serviceId: NSNumber
}
