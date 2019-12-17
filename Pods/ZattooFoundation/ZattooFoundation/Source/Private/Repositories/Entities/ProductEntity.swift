//
//  ProductEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero on 16.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ProductEntity: Codable {
    
    let sku: String
    let units: String
    let length: Int
    let shopId: String
    let serviceId: Int
    let isActive: Bool
    let name: String
    let currency: String
    let cost: Int
}
