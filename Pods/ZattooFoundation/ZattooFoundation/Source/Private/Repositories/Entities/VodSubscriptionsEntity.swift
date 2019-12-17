//
//  VodSubscriptionsEntity.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 8/17/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodSubscriptionsEntity: Codable {

    let subscriptions: [String: VodSubscriptionEntity]
}
