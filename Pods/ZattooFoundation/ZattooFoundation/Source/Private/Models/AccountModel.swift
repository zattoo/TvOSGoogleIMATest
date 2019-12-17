//
//  AccountModel.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct AccountModel {
    let publicId: String
    let username: String
    let recordedTvSeries: [SeriesSummaryModel]
    let restrictedUsageSoFar: Int?
    let restrictedUsageLimit: Int?
    let restrictedUsageResetDate: Date?
    let isHiQ: Bool
    let variantGroup: Int?
    let isNewSSOUser: Bool
    let services: [ServiceModel]
    let subscriptions: [SubscriptionModel]
    let products: [ProductModel]
    let transientPassword: String?
    let dateRegistered: Date?
}
