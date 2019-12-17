//
//  SubscriptionModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension SubscriptionModel: DTOConvertible {
    
    var DTO: Subscription {
        return Subscription(id: id, expiration: expiration, isAutoRenewing: isAutoRenewing, isExternalAutoRenewing: isExternalAutoRenewing, sku: sku, serviceId: serviceId)
    }
}
