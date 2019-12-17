//
//  RegisterTimeshiftModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 9/12/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension RegisterTimeshiftModel: DTOConvertible {
    
    var DTO: RegisterTimeshift {
        return RegisterTimeshift(
            registeredAt: registeredAt,
            allowedOffset: allowedOffset,
            allowedQualityLevel: allowedQualityLevel.DTO,
            isForwardSeekingEnabled: isForwardSeekingEnabled
        )
    }
}
