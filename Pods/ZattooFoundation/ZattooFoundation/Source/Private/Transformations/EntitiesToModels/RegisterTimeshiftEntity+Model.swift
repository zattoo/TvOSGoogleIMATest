//
//  RegisterTimeshiftEntity+Model.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 9/12/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension RegisterTimeshiftEntity: ModelConvertible {
    
    var model: RegisterTimeshiftModel {
        return RegisterTimeshiftModel(
            registeredAt: registeredAt,
            allowedOffset: allowedOffset,
            allowedQualityLevel: allowedQualityLevel.model,
            isForwardSeekingEnabled: isForwardSeekingEnabled
        )
    }
}
