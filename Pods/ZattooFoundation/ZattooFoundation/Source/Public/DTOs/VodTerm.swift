//
//  VodTerm.swift
//  ZattooFoundation
//
//  Created by David Cordero on 14.02.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class VodTerm: NSObject {
    public let isDrmRequired: Bool
    public let quality: QualityLevel
    public let price: String
    public let vodType: VodType
    public let videoToken: String
    public let token: String
    public let publishedUntil: Date
    public let publishedFrom: Date
    public let rentalPeriodInSeconds: Int
    public let subscriptionSku: String?
    public let subscriptionName: String?

    init(isDrmRequired: Bool, quality: QualityLevel, price: String, vodType: VodType, videoToken: String, token: String, publishedUntil: Date, publishedFrom: Date, rentalPeriodInSeconds: Int, subscriptionSku: String?, subscriptionName: String?) {
     
        self.isDrmRequired = isDrmRequired
        self.quality = quality
        self.price = price
        self.vodType = vodType
        self.videoToken = videoToken
        self.token = token
        self.publishedUntil = publishedUntil
        self.publishedFrom = publishedFrom
        self.rentalPeriodInSeconds = rentalPeriodInSeconds
        self.subscriptionSku = subscriptionSku
        self.subscriptionName = subscriptionName
    }
}
