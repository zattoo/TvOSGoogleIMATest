//
//  Stream.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/13/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc public enum MinimumConnectivity: Int {
    case wifi
}

public enum StreamType: String {
    case dash
    case dashPlayready = "dash_playready"
    case dashWidevine = "dash_widevine"
    case hls = "hls5"
    case hlsFairplay = "hls5_fairplay"
    case hls7
    case hls7Fairplay = "hls7_fairplay"
    case none
}

public enum AdType: String {
    case channelSwitch = "cs"
    case midroll
}

@objc(ZattooFoundationStream)
@objcMembers
final public class Stream: NSObject {

    public let url: URL
    public let castUrl: URL?
    public let castLicenseUrl: URL?
    public let castVastUrl: URL?
    public let stopUrl: URL?
    public let licenseUrl: URL?
    public let vastUrl: URL?
    public let adType: AdType?
    public let prepadding: TimeInterval
    public let postpadding: TimeInterval
    public let restrictedUsageTimeTillExpiration: Int?
    public let youthProtectionPinRequiredAt: Date?
    public let isSeekForwardEnabled: Bool
    public let isRegisterTimeshiftAllowed: Bool
    public let minConnectivity: MinimumConnectivity?
    public let watchUrls: [WatchUrl]

    init(url: URL,
         castUrl: URL?,
         castLicenseUrl: URL?,
         castVastUrl: URL?,
         stopUrl: URL?,
         licenseUrl: URL?,
         vastUrl: URL?,
         adType: AdType?,
         prepadding: TimeInterval,
         postpadding: TimeInterval,
         restrictedUsageTimeTillExpiration: Int?,
         youthProtectionPinRequiredAt: Date?,
         isSeekForwardEnabled: Bool,
         isRegisterTimeshiftAllowed: Bool,
         minConnectivity: MinimumConnectivity?,
         watchUrls: [WatchUrl]) {

        self.url = url
        self.castUrl = castUrl
        self.castLicenseUrl = castLicenseUrl
        self.castVastUrl = castVastUrl
        self.stopUrl = stopUrl
        self.licenseUrl = licenseUrl
        self.vastUrl = vastUrl
        self.adType = adType
        self.prepadding = prepadding
        self.postpadding = postpadding
        self.restrictedUsageTimeTillExpiration = restrictedUsageTimeTillExpiration
        self.youthProtectionPinRequiredAt = youthProtectionPinRequiredAt
        self.isSeekForwardEnabled = isSeekForwardEnabled
        self.isRegisterTimeshiftAllowed = isRegisterTimeshiftAllowed
        self.minConnectivity = minConnectivity
        self.watchUrls = watchUrls
    }
}
