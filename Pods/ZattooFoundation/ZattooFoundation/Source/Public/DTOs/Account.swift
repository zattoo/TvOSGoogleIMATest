//
//  Account.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


@objcMembers
final public class Account: NSObject {
    public let publicId: String
    public let username: String
    public let restrictedUsageSoFar: Int?
    public let restrictedUsageLimit: Int?
    public let restrictedUsageResetDate: Date?
    public let isHiQ: Bool
    public let variantGroup: Int?
    public let isNewSSOUser: Bool
    public let services: [Service]
    public let subscriptions: [Subscription]
    public let products: [Product]
    public let transientPassword: String?
    public let dateRegistered: Date?
    
    init(publicId: String,
         username: String,
         restrictedUsageSoFar: Int?,
         restrictedUsageLimit: Int?,
         restrictedUsageResetDate: Date?,
         isHiQ: Bool,
         variantGroup: Int?,
         isNewSSOUser: Bool,
         services: [Service],
         subscriptions: [Subscription],
         products: [Product],
         transientPassword: String?,
         dateRegistered: Date?) {
        
        self.publicId = publicId
        self.username = username
        self.restrictedUsageSoFar = restrictedUsageSoFar
        self.restrictedUsageLimit = restrictedUsageLimit
        self.restrictedUsageResetDate = restrictedUsageResetDate
        self.isHiQ = isHiQ
        self.variantGroup = variantGroup
        self.isNewSSOUser = isNewSSOUser
        self.services = services
        self.subscriptions = subscriptions
        self.products = products
        self.transientPassword = transientPassword
        self.dateRegistered = dateRegistered
    }
}
