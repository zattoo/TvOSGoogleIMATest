//
//  VodSubscriptionsEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 8/17/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension VodSubscriptionsEntity {

    init(json: JSON) {
        subscriptions = json.dictionaryValue.mapValues(VodSubscriptionEntity.init)
    }
}

