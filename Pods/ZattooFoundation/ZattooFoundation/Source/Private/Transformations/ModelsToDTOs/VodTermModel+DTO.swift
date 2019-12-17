//
//  VodTermModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 14.02.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodTermModel: DTOConvertible {
    
    var DTO: VodTerm {
        return VodTerm(isDrmRequired: isDrmRequired, quality: quality.DTO, price: price, vodType: vodType.DTO, videoToken: videoToken, token: token, publishedUntil: publishedUntil, publishedFrom: publishedFrom, rentalPeriodInSeconds:  rentalPeriodInSeconds, subscriptionSku: subscriptionSku, subscriptionName: subscriptionName)
    }
}
