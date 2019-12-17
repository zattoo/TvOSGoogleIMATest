//
//  ProductEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero on 16.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension ProductEntity {
    
    init(json: JSON) {
        sku = json["sku"].stringValue
        units = json["units"].stringValue
        length = json["length"].intValue
        shopId = json["shop_id"].stringValue
        serviceId = json["service_id"].intValue
        isActive = json["active"].boolValue
        name = json["name"].stringValue
        currency = json["currency"].stringValue
        cost = json["cost"].intValue
    }
}
