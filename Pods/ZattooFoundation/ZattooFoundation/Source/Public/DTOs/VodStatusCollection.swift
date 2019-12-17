//
//  VodStatusCollection.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/25/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


public typealias VodStatusDictionary = [TeasableId: VodStatus]
public typealias VodStatuses = [TeasableType: VodStatusDictionary]

final public class VodStatusCollection: NSObject {

    public let statuses: VodStatuses
    public let subscriptions: VodSubscriptions

    init(statuses: VodStatuses, subscriptions: VodSubscriptions) {
        self.statuses = statuses
        self.subscriptions = subscriptions
    }
}
