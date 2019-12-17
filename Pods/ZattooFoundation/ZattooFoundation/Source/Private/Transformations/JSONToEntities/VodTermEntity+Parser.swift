//
//  VodTermEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero on 14.02.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension VodTermEntity {
    
    init?(json: JSON) {
        let vodTypeString = json["vod_type"].stringValue
        guard let vodType = VodTypeEntity(rawValue: vodTypeString) else {
            return nil
        }

        self.vodType = vodType
        isDrmRequired = json["drm_required"].boolValue
        quality = json["quality"].qualityLevelEntityValue
        price = json["price"].stringValue
        videoToken = json["video_token"].stringValue
        token = json["token"].stringValue
        publishedUntil = json["published_until"].dateValue
        publishedFrom = json["published_from"].dateValue
        rentalPeriodInSeconds = json["rental_period_in_seconds"].intValue
        subscriptionSku = json["subscription_sku"].string
        subscriptionName = json["subscription_name"].string
    }
}
