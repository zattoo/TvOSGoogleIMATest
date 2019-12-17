//
//  SubscriptionEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 21.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension SubscriptionEntity: ModelConvertible {
    
    var model: SubscriptionModel {
        return SubscriptionModel(id: id, expiration: expiration, isAutoRenewing: isAutoRenewing, isExternalAutoRenewing: isExternalAutoRenewing, sku: sku, serviceId: NSNumber(value: serviceId))
    }
}
