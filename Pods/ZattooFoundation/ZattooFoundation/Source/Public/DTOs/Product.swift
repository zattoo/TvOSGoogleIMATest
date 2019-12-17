//
//  Product.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc(ZattooFoundationProduct)
final public class Product: NSObject {
    
    public let sku: String
    public let units: String
    public let length: NSNumber
    public let shopId: String
    public let serviceId: NSNumber
    public let isActive: Bool
    public let name: String
    public let currency: String
    public let cost: Int
    
    init(sku: String, units: String, length: NSNumber, shopId: String, serviceId: NSNumber, isActive: Bool, name: String, currency: String, cost: Int) {
        
        self.sku = sku
        self.units = units
        self.length = length
        self.shopId = shopId
        self.serviceId = serviceId
        self.isActive = isActive
        self.name = name
        self.currency = currency
        self.cost = cost
    }
}
