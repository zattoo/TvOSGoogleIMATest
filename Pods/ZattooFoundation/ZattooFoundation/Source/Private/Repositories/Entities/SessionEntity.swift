//
//  SessionEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct SessionEntity: Codable {
    
    let isActive: Bool
    let isLoggedIn: Bool
    let language: String?
    let aliasedCountry: AliasedCountryEntity?
    let minConnectivity: String?
    let serverTime: Date
    let generalTermsUrl: URL?
    let privacyPolicyUrl: URL?
    let isRecordingsEligible: Bool
    let isLocalRecordingEligible: Bool
    let isUpgradeAvailable: Bool
    let pghash: String
    let areAdsAllowed: Bool
    let adSkipTime: Int
    let partner: String?
    let trackingUrls: [TrackingUrlEntity]
    let startPagePublicId: String?
    let imageBaseUrl: URL?
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
    let account: AccountEntity?
    let consentsRequired: [String]
    let abTestGroups: String
    let broadcastPagePublicId: String
    let serviceRegionCountry: String
    let isVodEligible: Bool
    let isRecordingSubscribable: Bool
}
