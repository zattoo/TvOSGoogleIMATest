//
//  StreamEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/14/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension StreamEntity: ModelConvertible {

    var model: StreamModel {
        return StreamModel(url: url,
                           castUrl: castUrl,
                           castLicenseUrl: castLicenseUrl,
                           castVastUrl: castVastUrl,
                           stopUrl: stopUrl,
                           licenseUrl: licenseUrl,
                           vastUrl: vastUrl,
                           adType: AdTypeModel(rawValue: adType?.rawValue ?? ""),
                           prepadding: prepadding,
                           postpadding: postpadding,
                           restrictedUsageTimeTillExpiration: restrictedUsageTimeTillExpiration,
                           youthProtectionPinRequiredAt: youthProtectionPinRequiredAt,
                           isSeekForwardEnabled: isSeekForwardEnabled,
                           isRegisterTimeshiftAllowed: isRegisterTimeshiftAllowed, 
                           minConnectivity: minConnectivity?.model,
                           watchUrls: watchUrls.map { $0.model },
                           trackingUrls: trackingUrls)
    }
}
