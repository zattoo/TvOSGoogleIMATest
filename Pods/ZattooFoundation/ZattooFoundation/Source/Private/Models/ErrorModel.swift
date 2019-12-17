//
//  ErrorModel.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 4/14/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ErrorModel: Swift.Error, Equatable {
    let code: ErrorCodeModel
    let localizedDescriptions: [String: String]?
    
    init(code: ErrorCodeModel, localizedDescriptions: [String: String]? = nil) {
        self.code = code
        self.localizedDescriptions = localizedDescriptions
    }
}

func == (lhs: ErrorModel, rhs: ErrorModel) -> Bool {
    return lhs.code == rhs.code
}

enum ErrorCodeModel {
    case invalidJson
    case timeout
    case invalidData
    case invalidResponse
    case requestCancelled
    case resourceNotFound
    case noInternetConnection
    case serializationFailed
    case other
    case 🔥
    case unspecified
    case protocolNotHttps
    case sessionRequired
    case loginRequired
    case recordingRequired
    case invalidRecording
    case zattooMaintenance
    case appVersionIsTooOld
    case localeNotSupported
    case invalidAccountToken
    case serviceServerCouldNotBeContacted
    case missingAppId
    case invalidAppId
    case missingUUID
    case missingLang
    case invalidLang
    case invalidFormat
    case invalidLiveThumbsString
    case invalidProgramThumbsString
    case invalidSeasonNumber
    case invalidSessionToken
    case missingOrInvalidLoginOrPassword
    case accountManagementServerUnreachable
    case zattooAccountCouldNotBeCreatedOrUpdated
    case missingOrInvalidCredentialsOrAccountInformation
    case appIdZapiBaseHostNameUrlMismatch
    case zuyaServerFailed
    case tooManyLoginAttempts
    case missingPin
    case invalidPin
    case invalidPinConfig
    case pinLocked
    case purchaseBlocked
    case invalidStreamType
    case invalidChannelId
    case subscriptionRequiredToWatchContentFromThisChannel
    case missingRecordingId
    case invalidRecordingId
    case playlistIsFull
    case invalidConnectivity
    case internalNetworkRequired
    case userIsNotCurrentlyRecordingThisTvSeries
    case missingTeasableId
    case missingTesableType
    case invalidTeasableId
    case invalidTeasableType
    case teasableNotFound
    case contentWasAlreadyOrdered
    case orderNotFound
}
