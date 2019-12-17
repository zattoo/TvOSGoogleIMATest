//
//  Subscription.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc(ZattooFoundationSubscription)
final public class Subscription: NSObject {
    
    public let id: Int
    public let expiration: Date?
    public let isAutoRenewing: Bool
    public let isExternalAutoRenewing: Bool
    public let sku: String
    public let serviceId: NSNumber
    
    init(id: Int, expiration: Date?, isAutoRenewing: Bool, isExternalAutoRenewing: Bool, sku: String, serviceId: NSNumber) {
        self.id = id
        self.expiration = expiration
        self.isAutoRenewing = isAutoRenewing
        self.isExternalAutoRenewing = isExternalAutoRenewing
        self.sku = sku
        self.serviceId = serviceId
    }
}
