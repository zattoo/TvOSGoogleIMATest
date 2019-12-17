//
//  StreamEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/14/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension StreamEntity {
    
    init?(json: JSON,
          restrictedUsageTimeTillExpiration: Int?,
          youthProtectionPinRequiredAt: Date?,
          minConnectivity: MinimumConnectivityEntity?,
          trackingUrls: [URL],
          isRegisterTimeshiftAllowed: Bool) {
        
        guard let watchUrls = json["watch_urls"].array,
            !watchUrls.isEmpty, let url = watchUrls.first?["url"].url else {
                return nil
        }

        self.url = url
        self.castUrl = json["cast_url"].url
        self.castLicenseUrl = json["cast_license_url"].url
        self.stopUrl = json["stop_url"].url
        self.licenseUrl = json["watch_urls"].arrayValue.filter({ $0["license_url"].url != nil }).first?["license_url"].url
        self.vastUrl = json["ad"].dictionaryValue["vast_url"]?.url
        self.castVastUrl = json["ad"].dictionaryValue["cast_vast_url"]?.url
        self.adType = AdTypeEntity(rawValue: json["ad"].dictionaryValue["type"]?.string ?? "")
        self.prepadding = json["padding"].dictionary?["pre"]?.doubleValue ?? 0
        self.postpadding = json["padding"].dictionary?["post"]?.doubleValue ?? 0
        self.restrictedUsageTimeTillExpiration = restrictedUsageTimeTillExpiration
        self.youthProtectionPinRequiredAt = youthProtectionPinRequiredAt
        self.isSeekForwardEnabled = json["forward_seeking"].bool ?? true
        self.isRegisterTimeshiftAllowed = isRegisterTimeshiftAllowed
        self.minConnectivity = minConnectivity
        self.watchUrls = watchUrls.filter({ $0["audio_channel"].url != nil }).compactMap { WatchUrlEntity(json: $0) }
        self.trackingUrls = trackingUrls
    }
}
