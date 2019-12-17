//
//  StreamModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/14/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension StreamModel: DTOConvertible {
    
    var DTO: Stream {
        return Stream(model: self)
    }
}

private extension Stream {
    convenience init(model: StreamModel) {
        self.init(url: model.url,
                  castUrl: model.castUrl,
                  castLicenseUrl: model.castLicenseUrl,
                  castVastUrl: model.castVastUrl,
                  stopUrl: model.stopUrl,
                  licenseUrl: model.licenseUrl,
                  vastUrl: model.vastUrl,
                  adType: AdType(rawValue: model.adType?.rawValue ?? ""),
                  prepadding: model.prepadding,
                  postpadding: model.postpadding,
                  restrictedUsageTimeTillExpiration: model.restrictedUsageTimeTillExpiration,
                  youthProtectionPinRequiredAt: model.youthProtectionPinRequiredAt,
                  isSeekForwardEnabled: model.isSeekForwardEnabled,
                  isRegisterTimeshiftAllowed: model.isRegisterTimeshiftAllowed,
                  minConnectivity: model.minConnectivity?.DTO,
                  watchUrls: model.watchUrls.map { $0.DTO })
    }
}
