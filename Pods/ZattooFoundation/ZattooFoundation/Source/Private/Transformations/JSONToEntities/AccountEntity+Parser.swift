//
//  AccountEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension AccountEntity {
    
    init(json: JSON) {
        publicId = json["public_id"].stringValue
        username = json["login"].stringValue
        recordedTvSeries = json["recorded_tv_series"].transformEachElement(toSeriesSummaryEntity)
        restrictedUsageSoFar = json["restricted_usage_so_far"].int
        restrictedUsageLimit = json["restricted_usage_limit"].int
        restrictedUsageResetDate = json["restricted_usage_reset"].date
        services = json["services"].transformEachElement(toServiceEntity)
        subscriptions = json["subscriptions"].transformEachElement(toSubscriptionEntity)
        products = json["products"].transformEachElement(toProductEntity)
        variantGroup = json["variant_group"].int
        isNewSSOUser = json["new_sso_user"].boolValue
        transientPassword = json["password"].string
        dateRegistered = json["dateregistered"].date
    }
}

// MARK: - Private

private func toServiceEntity(json: JSON) -> ServiceEntity? {
    return ServiceEntity(json: json)
}

private func toSeriesSummaryEntity(json: JSON) -> SeriesSummaryEntity {
    return SeriesSummaryEntity(json: json)
}

private func toSubscriptionEntity(json: JSON) -> SubscriptionEntity {
    return SubscriptionEntity(json: json)
}

private func toProductEntity(json: JSON) -> ProductEntity {
    return ProductEntity(json: json)
}
