//
//  Account+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension AccountModel: DTOConvertible {
    
    var DTO: Account {
        return Account(publicId: publicId,
                       username: username,
                       restrictedUsageSoFar: restrictedUsageSoFar,
                       restrictedUsageLimit: restrictedUsageLimit,
                       restrictedUsageResetDate: restrictedUsageResetDate,
                       isHiQ: isHiQ,
                       variantGroup: variantGroup,
                       isNewSSOUser: isNewSSOUser,
                       services: services.map { $0.DTO },
                       subscriptions: subscriptions.map { $0.DTO },
                       products: products.map { $0.DTO },
                       transientPassword: transientPassword,
                       dateRegistered: dateRegistered
        )
    }
}
