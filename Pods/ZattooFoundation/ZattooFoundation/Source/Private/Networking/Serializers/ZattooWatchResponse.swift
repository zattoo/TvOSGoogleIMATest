//
//  ZattooWatchResponse.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/14/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooWatchResponse: SwiftyJsonResponseSerializable {
    let stream: StreamEntity
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init?(json: JSON) {
        guard json["success"].boolValue else { return nil }
        
        let streamJson = json["stream"]
        let restrictedUsageTimeTillExpiration = json["restricted_usage_expiration"].int
        let youthProtectionPinRequiredAt = json["youth_protection_pin_required_at"].date
        let minimumConnectivityString = json["min_connectivity"].stringValue
        let isRegisterTimeshiftAllowed = json["register_timeshift_allowed"].boolValue
        let minConnectivity = MinimumConnectivityEntity(rawValue: minimumConnectivityString)
        
        let trackingUrls = json["urls"].arrayValue.compactMap { $0.url }
        
        guard let streamEntityValue = StreamEntity(json: streamJson,
                                                   restrictedUsageTimeTillExpiration: restrictedUsageTimeTillExpiration,
                                                   youthProtectionPinRequiredAt: youthProtectionPinRequiredAt,
                                                   minConnectivity: minConnectivity,
                                                   trackingUrls: trackingUrls,
                                                   isRegisterTimeshiftAllowed: isRegisterTimeshiftAllowed) else {
                                                    return nil
        }
        stream = streamEntityValue
    }
}
