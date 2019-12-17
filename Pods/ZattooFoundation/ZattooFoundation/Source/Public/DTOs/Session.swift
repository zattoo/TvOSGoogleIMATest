//
//  Session.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/24/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


public typealias PartnerId = String

@objcMembers
final public class Session: NSObject {
    
    public let isActive: Bool
    public let isLoggedIn: Bool
    public let isRecordingsEligible: Bool
    public let pghash: String
    public let imageBaseUrl: URL?
    public let aliasedCountry: AliasedCountry?
    public let minConnectivity: String?
    public let serverTime: Date
    public let generalTermsUrl: URL?
    public let privacyPolicyUrl: URL?
    public let isLocalRecordingEligible: Bool
    public let isUpgradeAvailable: Bool
    public let areAdsAllowed: Bool
    public let adSkipTime: Int
    public let partner: String?
    public let trackingUrls: [(event: String, url: URL)]
    public let startPagePublicId: String?
    public let channelPagePublicId: String?
    public let onDemandPagePublicId: String?
    public let recordingsPagePublicId: String?
    public let maxSignupBirthdate: String?
    public let useEmbedLayout: Bool?
    public let vodProviders: [String]
    public let ppid: String?
    public let logoBaseUrl: URL?
    public let isSeriesRecordingEligible: Bool
    public let maxPlaylistSize: Int?
    public let maxPlaylistDuration: Int?
    public let isRecallEligible: Bool
    public let isRecallSubscribable: Bool
    public let isSelectiveRecallEligible: Bool
    public let recallStartTime: Date?
    public let recallSeconds: Int
    public let shopUrl: URL?
    public let account: Account?
    public let consentsRequired: [String]
    public let abTestGroups: String
    public let broadcastPagePublicId: String
    public let serviceRegionCountry: String
    public let language: String?
    public let isVodEligible: Bool
    public let isRecordingSubscribable: Bool

    
    init(isActive: Bool,
         isLoggedIn: Bool,
         isRecordingsEligible: Bool,
         pghash: String,
         imageBaseUrl: URL?,
         aliasedCountry: AliasedCountry?,
         minConnectivity: String?,
         serverTime: Date,
         generalTermsUrl: URL?,
         privacyPolicyUrl: URL?,
         isLocalRecordingEligible: Bool,
         isUpgradeAvailable: Bool,
         areAdsAllowed: Bool,
         adSkipTime: Int,
         partner: String?,
         trackingUrls: [(event: String, url: URL)],
         startPagePublicId: String?,
         channelPagePublicId: String?,
         onDemandPagePublicId: String?,
         recordingsPagePublicId: String?,
         maxSignupBirthdate: String?,
         useEmbedLayout: Bool?,
         vodProviders: [String],
         ppid: String?,
         logoBaseUrl: URL?,
         isSeriesRecordingEligible: Bool,
         maxPlaylistSize: Int?,
         maxPlaylistDuration: Int?,
         isRecallEligible: Bool,
         isRecallSubscribable: Bool,
         isSelectiveRecallEligible: Bool,
         recallStartTime: Date?,
         recallSeconds: Int,
         shopUrl: URL?,
         account: Account?,
         consentsRequired: [String],
         abTestGroups: String,
         broadcastPagePublicId: String,
         serviceRegionCountry: String,
         language: String?,
         isVodEligible: Bool,
         isRecordingSubscribable: Bool) {
        
        self.isActive = isActive
        self.isLoggedIn = isLoggedIn
        self.isRecordingsEligible = isRecordingsEligible
        self.pghash = pghash
        self.imageBaseUrl = imageBaseUrl
        self.aliasedCountry = aliasedCountry
        self.minConnectivity = minConnectivity
        self.serverTime = serverTime
        self.generalTermsUrl = generalTermsUrl
        self.privacyPolicyUrl = privacyPolicyUrl
        self.isLocalRecordingEligible = isLocalRecordingEligible
        self.isUpgradeAvailable = isUpgradeAvailable
        self.areAdsAllowed = areAdsAllowed
        self.adSkipTime = adSkipTime
        self.partner = partner
        self.trackingUrls = trackingUrls
        self.startPagePublicId = startPagePublicId
        self.channelPagePublicId = channelPagePublicId
        self.onDemandPagePublicId = onDemandPagePublicId
        self.recordingsPagePublicId = recordingsPagePublicId
        self.maxSignupBirthdate = maxSignupBirthdate
        self.useEmbedLayout = useEmbedLayout
        self.vodProviders = vodProviders
        self.ppid = ppid
        self.logoBaseUrl = logoBaseUrl
        self.isSeriesRecordingEligible = isSeriesRecordingEligible
        self.maxPlaylistSize = maxPlaylistSize
        self.maxPlaylistDuration = maxPlaylistDuration
        self.isRecallEligible = isRecallEligible
        self.isRecallSubscribable = isRecallSubscribable
        self.isSelectiveRecallEligible = isSelectiveRecallEligible
        self.recallStartTime = recallStartTime
        self.recallSeconds = recallSeconds
        self.shopUrl = shopUrl
        self.account = account
        self.consentsRequired = consentsRequired
        self.abTestGroups = abTestGroups
        self.broadcastPagePublicId = broadcastPagePublicId
        self.serviceRegionCountry = serviceRegionCountry
        self.language = language
        self.isVodEligible = isVodEligible
        self.isRecordingSubscribable = isRecordingSubscribable
    }
}

