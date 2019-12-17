//
//  VodStatusEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/22/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension VodStatusEntity {
    
    init(json: JSON) {
        let vodTypeString = json["vod_type"].stringValue
        self.vodType = VodTypeEntity(rawValue: vodTypeString)
        isExpired = json["expired"].boolValue
        teasableId = json["teasable_id"].stringValue
        teasableType = json["teasable_type"].teasableTypeEntityValue
        orderId = json["order_id"].intValue
        orderedAt = json["ordered_at"].dateValue
        orderedUntil = json["ordered_until"].date
        price = json["price"].stringValue
        qualityLevel = json["quality"].qualityLevelEntityValue
        termToken = json["term_token"].stringValue
        title = json["title"].stringValue
        videoToken = json["video_token"].stringValue
        position = json["position"].doubleValue
        isDrmRequired = json["drm_required"].boolValue
        isOrdered = json["ordered"].boolValue
    }
}
