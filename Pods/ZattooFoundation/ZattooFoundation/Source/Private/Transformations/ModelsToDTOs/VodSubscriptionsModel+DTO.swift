//
//  VodSubscriptionsModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 8/18/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodSubscriptionsModel: DTOConvertible {

    var DTO: VodSubscriptions {
        let subscriptions = self.subscriptions.mapValues { $0.DTO }
        return VodSubscriptions(subscriptions: subscriptions)
    }
}
