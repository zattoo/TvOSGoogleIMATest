//
//  AccountEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension AccountEntity: ModelConvertible {
    
    var model: AccountModel {
        return AccountModel(publicId: publicId,
                            username: username,
                            recordedTvSeries: recordedTvSeries.map { $0.model },
                            restrictedUsageSoFar: restrictedUsageSoFar,
                            restrictedUsageLimit: restrictedUsageLimit,
                            restrictedUsageResetDate: restrictedUsageResetDate,
                            isHiQ: isHiQ,
                            variantGroup: variantGroup,
                            isNewSSOUser: isNewSSOUser,
                            services: services.map { $0.model },
                            subscriptions: subscriptions.map { $0.model },
                            products: products.map { $0.model },
                            transientPassword: transientPassword,
                            dateRegistered: dateRegistered)
    }
}
