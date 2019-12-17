//
//  SubscriptionEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero on 16.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension SubscriptionEntity {
    
    init(json: JSON) {
        id = json["id"].intValue
        expiration = json["expiration"].date
        isAutoRenewing = json["autorenewing"].boolValue
        isExternalAutoRenewing = json["external_autorenewing"].boolValue
        sku = json["sku"].stringValue
        serviceId = json["service_id"].intValue
    }
}
