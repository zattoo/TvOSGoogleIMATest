//
//  SessionModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension SessionModel: DTOConvertible {
    
    var DTO: Session {
        return Session(isActive: isActive,
                       isLoggedIn: isLoggedIn,
                       isRecordingsEligible: isRecordingsEligible,
                       pghash: pghash,
                       imageBaseUrl: imageBaseUrl,
                       aliasedCountry: aliasedCountry?.DTO,
                       minConnectivity: minConnectivity,
                       serverTime: serverTime,
                       generalTermsUrl: generalTermsUrl,
                       privacyPolicyUrl: privacyPolicyUrl,
                       isLocalRecordingEligible: isLocalRecordingEligible,
                       isUpgradeAvailable: isUpgradeAvailable,
                       areAdsAllowed: areAdsAllowed,
                       adSkipTime: adSkipTime,
                       partner: partner,
                       trackingUrls: trackingUrls,
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
                       account: account?.DTO,
                       consentsRequired: consentsRequired,
                       abTestGroups: abTestGroups,
                       broadcastPagePublicId: broadcastPagePublicId,
                       serviceRegionCountry: serviceRegionCountry,
                       language: language,
                       isVodEligible: isVodEligible,
                       isRecordingSubscribable: isRecordingSubscribable)
    }
}
