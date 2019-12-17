//
//  VodTermEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 14.02.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodTermEntity: ModelConvertible {
    
    var model: VodTermModel {
        return VodTermModel(isDrmRequired: isDrmRequired,
                                 quality: quality.model,
                                 price: price,
                                 vodType: vodType.model,
                                 videoToken: videoToken,
                                 token: token,
                                 publishedUntil: publishedUntil,
                                 publishedFrom: publishedFrom,
                                 rentalPeriodInSeconds: rentalPeriodInSeconds,
                                 subscriptionSku: subscriptionSku,
                                 subscriptionName: subscriptionName)
    }
}
