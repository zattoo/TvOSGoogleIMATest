//
//  StreamEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/14/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


enum MinimumConnectivityEntity: String, Codable {
    case wifi
}

enum AdTypeEntity: String, Codable {
    case channelSwitch = "cs"
    case midroll
}

struct StreamEntity: Codable {
    let url: URL
    let castUrl: URL?
    let castLicenseUrl: URL?
    let castVastUrl: URL?
    let stopUrl: URL?
    let licenseUrl: URL?
    let vastUrl: URL?
    let adType: AdTypeEntity?
    let prepadding: TimeInterval
    let postpadding: TimeInterval
    let restrictedUsageTimeTillExpiration: Int?
    let youthProtectionPinRequiredAt: Date?
    let isSeekForwardEnabled: Bool
    let isRegisterTimeshiftAllowed: Bool
    let minConnectivity: MinimumConnectivityEntity?
    let watchUrls: [WatchUrlEntity]
    let trackingUrls: [URL]
}
