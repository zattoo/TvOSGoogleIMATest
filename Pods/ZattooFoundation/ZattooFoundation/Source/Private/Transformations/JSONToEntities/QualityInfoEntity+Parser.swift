//
//  QualityInfo+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 4/14/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension QualityInfoEntity {
    
    init?(json: JSON) {
        guard let availabilityString = json["availability"].string else {
            return nil
        }
        
        guard let availabilityEntityValue = AvailabilityEntity(rawValue: availabilityString) else {
            return nil
        }
        
        availabilityEntity = availabilityEntityValue
        title = json["title"].stringValue
        streamTypes = json["stream_types"].transformEachElement { $0.stringValue }
        qualityLevelEntity = json["level"].qualityLevelEntityValue
        drmRequired = json["drm_required"].boolValue
        logoToken = json["logo_token"].string
    }
}
