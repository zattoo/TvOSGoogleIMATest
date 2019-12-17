//
//  RegisterTimeshiftEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 9/12/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import SwiftyJSON
import Foundation


extension RegisterTimeshiftEntity {
    
    init(json: JSON) {
        registeredAt = json["registered_at"].dateValue
        allowedOffset = json["allowed_offset"].intValue
        allowedQualityLevel = json["allowed_quality"].qualityLevelEntityValue
        isForwardSeekingEnabled = json["forward_seeking"].bool ?? true
    }
}
