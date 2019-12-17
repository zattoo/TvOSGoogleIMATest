//
//  SessionEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension SessionEntity {
    
    init?(json: JSON) {
        
        guard let pghashValue = json["power_guide_hash"].string else {
            return nil
        }
        
        pghash = pghashValue
        language = json["language"].string
        aliasedCountry = AliasedCountryEntity(rawValue: json["aliased_country_code"].stringValue)
        isActive = json["active"].boolValue
        isLoggedIn = json["loggedin"].boolValue
        generalTermsUrl = json["general_terms"].url
        privacyPolicyUrl = json["privacy_policy"].url
        areAdsAllowed = json["ads_allowed"].boolValue
        partner = json["partner"].string
        startPagePublicId = json["start_page_public_id"].string
        imageBaseUrl = json["image_base_url"].url
        channelPagePublicId = json["channel_page_public_id"].string
        onDemandPagePublicId = json["vod_page_public_id"].string
        recordingsPagePublicId = json["recordings_page_public_id"].string
        maxSignupBirthdate = json["max_signup_birthdate"].string
        useEmbedLayout = json["use_embed_layout"].bool
        minConnectivity = json["min_connectivity"].string
        ppid = json["ppid"].string
        logoBaseUrl = json["logo_base_url"].url
        isRecordingsEligible = json["recording_eligible"].boolValue
        isLocalRecordingEligible = json["local_recording_eligible"].boolValue
        isUpgradeAvailable = json["upgrade_available"].boolValue
        serverTime = json["current_time"].dateValue
        vodProviders = json["vod_providers"].transformEachElement { $0.stringValue }
        adSkipTime = json["ad_skip_time"].intValue
        isSeriesRecordingEligible = json["series_recording_eligible"].boolValue
        maxPlaylistSize = json["max_playlist_size"].int
        maxPlaylistDuration = json["max_playlist_duration"].int
        isRecallEligible = json["recall_eligible"].boolValue
        isRecallSubscribable = json["recall_subscribable"].boolValue
        isSelectiveRecallEligible = json["selective_recall_eligible"].boolValue
        recallStartTime = json["recall_start_time"].date
        recallSeconds = json["recall_seconds"].intValue
        shopUrl = json["shop_url"].url

        trackingUrls = json["tracking_urls"].transformEachElement(toTrackingUrlEntity)
        
        if json["user"].exists() {
            account = AccountEntity(json: json["user"])
        }
        else {
            account = nil
        }

        consentsRequired = json["consent_required"].arrayValue.map({ $0.stringValue })
        abTestGroups = json["ab_test_groups"].stringValue
        broadcastPagePublicId = json["broadcast_page_public_id"].stringValue
        serviceRegionCountry = json["service_region_country"].stringValue
        isVodEligible = json["vod_eligible"].boolValue
        isRecordingSubscribable = json["recording_subscribable"].boolValue
    }
}

// MARK: - Private

private func toTrackingUrlEntity(json: JSON) -> TrackingUrlEntity? {
    return TrackingUrlEntity(json: json)
}

