//
//  StreamModel.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/14/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation

enum MinimumConnectivityModel: String {
    case wifi
}

enum AdTypeModel: String {
    case channelSwitch = "cs"
    case midroll
}

struct StreamModel {
    let url: URL
    let castUrl: URL?
    let castLicenseUrl: URL?
    let castVastUrl: URL?
    let stopUrl: URL?
    let licenseUrl: URL?
    let vastUrl: URL?
    let adType: AdTypeModel?
    let prepadding: TimeInterval
    let postpadding: TimeInterval
    let restrictedUsageTimeTillExpiration: Int?
    let youthProtectionPinRequiredAt: Date?
    let isSeekForwardEnabled: Bool
    let isRegisterTimeshiftAllowed: Bool
    let minConnectivity: MinimumConnectivityModel?
    let watchUrls: [WatchUrlModel]
    let trackingUrls: [URL]
}
