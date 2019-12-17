//
//  ProductEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 21.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension ProductEntity: ModelConvertible {
    
    var model: ProductModel {
        return ProductModel(sku: sku, units: units, length: NSNumber(value: length), shopId: shopId, serviceId: NSNumber(value: serviceId), isActive: isActive, name: name, currency: currency, cost: cost)
    }
}
