//
//  AccountEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct AccountEntity: Codable {
    let publicId: String
    let username: String
    let recordedTvSeries: [SeriesSummaryEntity]
    let restrictedUsageSoFar: Int?
    let restrictedUsageLimit: Int?
    let restrictedUsageResetDate: Date?
    let services: [ServiceEntity]
    let subscriptions: [SubscriptionEntity]
    let products: [ProductEntity]
    let variantGroup: Int?
    let isNewSSOUser: Bool
    let transientPassword: String?
    let dateRegistered: Date?
}
