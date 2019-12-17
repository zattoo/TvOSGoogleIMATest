//
//  ProductModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation

extension ProductModel: DTOConvertible {
    
    var DTO: Product {
        return Product(sku: sku, units: units, length: length, shopId: shopId, serviceId: serviceId, isActive: isActive, name: name, currency: currency, cost: cost)
    }
}
