//
//  NetworkEntityError.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 6/2/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


class NetworkEntityError: Swift.Error, Equatable {
    
    let code: NetworkEntityErrorCode
    let localizedDescriptions: [String: String]?
    
    required init(code: NetworkEntityErrorCode, localizedDescriptions: [String: String]? = nil) {
        self.code = code
        self.localizedDescriptions = localizedDescriptions
    }
    
    required init(json: JSON) {
        code = NetworkEntityErrorCode(rawValue: json["internal_code"].intValue) ?? .🔥
        localizedDescriptions = json["errors"].dictionaryObject as? [String: String]
    }
}

func == (lhs: NetworkEntityError, rhs: NetworkEntityError) -> Bool {
    return lhs.code == rhs.code
}

enum NetworkEntityErrorCode: Int {
    case invalidJson = -9
    case timeout = -8
    case invalidData = -7
    case invalidResponse = -6
    case requestCancelled = -5
    case resourceNotFound = -4
    case noInternetConnection = -3
    case serializationFailed = -2
    case other = -1
    case 🔥 = 0
    case unspecified = 1
    case protocolNotHttps = 2
    case sessionRequired = 3
    case loginRequired = 4
    case recordingRequired = 6
    case invalidRecording = 7
    case zattooMaintenance = 8
    case appVersionIsTooOld = 9
    case localeNotSupported = 12
    case invalidAccountToken = 22
    case serviceServerCouldNotBeContacted = 100
    case missingAppId = 101
    case invalidAppId = 102
    case missingUUID = 103
    case missingLang = 104
    case invalidLang = 105
    case invalidFormat = 106
    case invalidLiveThumbsString = 107
    case invalidProgramThumbsString = 108
    case invalidSessionToken = 111
    case missingOrInvalidLoginOrPassword = 200
    case accountManagementServerUnreachable = 201
    case zattooAccountCouldNotBeCreatedOrUpdated = 202
    case missingOrInvalidCredentialsOrAccountInformation = 203
    case appIdZapiBaseHostNameUrlMismatch = 211
    case zuyaServerFailed = 213
    case tooManyLoginAttempts = 214
    case missingPin = 261
    case invalidPin = 262
    case invalidPinConfig = 263
    case pinLocked = 264
    case purchaseBlocked = 265
    case invalidStreamType = 401
    case addingLotsOfSeriesRecordingWarning = 409
    case invalidChannelId = 421
    case subscriptionRequiredToWatchContentFromThisChannel = 422
    case missingRecordingId = 425
    case invalidRecordingId = 426
    case playlistIsFull = 428
    case invalidConnectivity = 429
    case internalNetworkRequired = 436
    case invalidSeasonNumber = 451
    case userIsNotCurrentlyRecordingThisTvSeries = 464
    case missingTeasableId = 540
    case missingTesableType = 541
    case invalidTeasableId = 542
    case invalidTeasableType = 543
    case teasableNotFound = 544
    case contentWasAlreadyOrdered = 582
    case orderNotFound = 583
}
