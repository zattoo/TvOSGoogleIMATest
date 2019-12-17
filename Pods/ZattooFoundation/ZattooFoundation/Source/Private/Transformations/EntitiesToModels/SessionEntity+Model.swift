//
//  SessionEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension SessionEntity: ModelConvertible {
    
    var model: SessionModel {
        return SessionModel(isActive: isActive,
                            isLoggedIn: isLoggedIn,
                            isRecordingsEligible: isRecordingsEligible,
                            pghash: pghash,
                            imageBaseUrl: imageBaseUrl,
                            aliasedCountry: aliasedCountry?.model,
                            minConnectivity: minConnectivity,
                            serverTime: serverTime,
                            generalTermsUrl: generalTermsUrl,
                            privacyPolicyUrl: privacyPolicyUrl,
                            isLocalRecordingEligible: isLocalRecordingEligible,
                            isUpgradeAvailable: isUpgradeAvailable,
                            areAdsAllowed: areAdsAllowed,
                            adSkipTime: adSkipTime,
                            partner: partner,
                            trackingUrls: trackingUrls.map { (event: $0.event, url: $0.url) },
                            startPagePublicId: startPagePublicId,
                            channelPagePublicId: channelPagePublicId,
                            onDemandPagePublicId: onDemandPagePublicId,
                            recordingsPagePublicId: recordingsPagePublicId,
                            maxSignupBirthdate: maxSignupBirthdate,
                            useEmbedLayout: useEmbedLayout,
                            vodProviders: vodProviders,
                            ppid: ppid,
                            logoBaseUrl: logoBaseUrl,
                            isSeriesRecordingEligible: isSeriesRecordingEligible,
                            maxPlaylistSize: maxPlaylistSize,
                            maxPlaylistDuration: maxPlaylistDuration,
                            isRecallEligible: isRecallEligible,
                            isRecallSubscribable: isRecallSubscribable,
                            isSelectiveRecallEligible: isSelectiveRecallEligible,
                            recallStartTime: recallStartTime,
                            recallSeconds: recallSeconds,
                            shopUrl: shopUrl,
                            account: account?.model,
                            consentsRequired: consentsRequired,
                            abTestGroups: abTestGroups,
                            broadcastPagePublicId: broadcastPagePublicId,
                            serviceRegionCountry: serviceRegionCountry,
                            language: language,
                            isVodEligible: isVodEligible,
                            isRecordingSubscribable: isRecordingSubscribable)
    }
}
