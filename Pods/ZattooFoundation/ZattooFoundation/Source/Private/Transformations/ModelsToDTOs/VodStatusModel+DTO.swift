//
//  VodStatusModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/25/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodStatusModel: DTOConvertible {

    var DTO: VodStatus {
        return VodStatus(
            isOrderExpired: isExpired,
            teasableId: teasableId,
            teasableType: teasableType.DTO,
            orderId: orderId,
            orderedAt: orderedAt,
            orderedUntil: orderedUntil,
            price: price,
            qualityLevel: qualityLevel.DTO,
            termToken: termToken,
            title: title,
            videoToken: videoToken,
            vodType: vodType?.DTO,
            lastPosition: lastPosition,
            isDrmRequired: isDrmRequired,
            isOrdered: isOrdered
        )
    }
}
