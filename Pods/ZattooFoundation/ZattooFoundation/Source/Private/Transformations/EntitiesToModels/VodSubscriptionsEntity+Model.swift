//
//  VodSubscriptionsEntity+Model.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 8/18/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodSubscriptionsEntity: ModelConvertible {

    var model: VodSubscriptionsModel {
        let subscriptions = self.subscriptions.mapValues { $0.model }
        return VodSubscriptionsModel(subscriptions: subscriptions)
    }
}
