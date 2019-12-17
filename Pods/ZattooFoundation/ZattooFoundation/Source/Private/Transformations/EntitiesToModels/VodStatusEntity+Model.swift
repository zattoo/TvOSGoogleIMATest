//
//  VodStatusEntity+Model.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/25/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodStatusEntity: ModelConvertible {

    var model: VodStatusModel {
        return VodStatusModel(
            isExpired: isExpired,
            teasableId: teasableId,
            teasableType: teasableType.model,
            orderId: orderId,
            orderedAt: orderedAt,
            orderedUntil: orderedUntil,
            price: price,
            qualityLevel: qualityLevel.model,
            termToken: termToken,
            title: title,
            videoToken: videoToken,
            vodType: vodType?.model,
            lastPosition: position,
            isDrmRequired: isDrmRequired,
            isOrdered: isOrdered
        )
    }
}
