//
//  SessionModel.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/24/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct SessionModel {
    let isActive: Bool
    let isLoggedIn: Bool
    let isRecordingsEligible: Bool
    let pghash: String
    let imageBaseUrl: URL?
    let aliasedCountry: AliasedCountryModel?
    let minConnectivity: String?
    let serverTime: Date
    let generalTermsUrl: URL?
    let privacyPolicyUrl: URL?
    let isLocalRecordingEligible: Bool
    let isUpgradeAvailable: Bool
    let areAdsAllowed: Bool
    let adSkipTime: Int
    let partner: String?
    let trackingUrls: [(event: String, url: URL)]
    let startPagePublicId: String?
    let channelPagePublicId: String?
    let onDemandPagePublicId: String?
    let recordingsPagePublicId: String?
    let maxSignupBirthdate: String?
    let useEmbedLayout: Bool?
    let vodProviders: [String]
    let ppid: String?
    let logoBaseUrl: URL?
    let isSeriesRecordingEligible: Bool
    let maxPlaylistSize: Int?
    let maxPlaylistDuration: Int?
    let isRecallEligible: Bool
    let isRecallSubscribable: Bool
    let isSelectiveRecallEligible: Bool
    let recallStartTime: Date?
    let recallSeconds: Int
    let shopUrl: URL?
    let account: AccountModel?
    let consentsRequired: [String]
    let abTestGroups: String
    let broadcastPagePublicId: String
    let serviceRegionCountry: String
    let language: String?
    let isVodEligible: Bool
    let isRecordingSubscribable: Bool
}
