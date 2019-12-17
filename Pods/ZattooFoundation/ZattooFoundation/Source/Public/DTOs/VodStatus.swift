//
//  VodStatus.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/25/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class VodStatus: NSObject {
    public let teasableId: TeasableId
    public let teasableType: TeasableType
    public let orderId: Int
    public let orderedAt: Date
    public let orderedUntil: Date?
    public let price: String
    public let qualityLevel: QualityLevel
    public let termToken: String
    public let title: String
    public let videoToken: String
    public let vodType: VodType?
    public let lastPosition: TimeInterval
    public let isDrmRequired: Bool
    public let isOrdered: Bool
    let isOrderExpired: Bool

    init(isOrderExpired: Bool,
         teasableId: TeasableId,
         teasableType: TeasableType,
         orderId: Int,
         orderedAt: Date,
         orderedUntil: Date?,
         price: String,
         qualityLevel: QualityLevel,
         termToken: String,
         title: String,
         videoToken: String,
         vodType: VodType?,
         lastPosition: TimeInterval,
         isDrmRequired: Bool,
         isOrdered: Bool) {

        self.isOrderExpired = isOrderExpired
        self.teasableId = teasableId
        self.teasableType = teasableType
        self.orderId = orderId
        self.orderedAt = orderedAt
        self.orderedUntil = orderedUntil
        self.price = price
        self.qualityLevel = qualityLevel
        self.termToken = termToken
        self.title = title
        self.videoToken = videoToken
        self.vodType = vodType
        self.lastPosition = lastPosition
        self.isDrmRequired = isDrmRequired
        self.isOrdered = isOrdered
    }
}

public enum VodStatusOrderedState {
    case expired
    case purchased
    case rented(orderedUntil: Date)
    case subscribed(sku: String, name: String?)
    case notSubscribed(name: String?, isSubscriptionOnly: Bool)
    case error(ErrorReason)

    public enum ErrorReason {
        case seasonHasNoEpisodes
    }
}
