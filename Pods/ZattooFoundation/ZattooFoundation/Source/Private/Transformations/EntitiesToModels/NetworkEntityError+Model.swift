//
//  NetworkEntityError+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/2/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension NetworkEntityError: ModelConvertible {
    
    var model: ErrorModel {
        return ErrorModel(code: code.model, localizedDescriptions: localizedDescriptions)
    }
}

extension NetworkEntityErrorCode: ModelConvertible {
    
    var model: ErrorCodeModel {
        switch self {
        case .invalidJson:
            return .invalidJson
        case .timeout:
            return .timeout
        case .invalidData:
            return .invalidData
        case .invalidResponse:
            return .invalidResponse
        case .requestCancelled:
            return .requestCancelled
        case .resourceNotFound:
            return .resourceNotFound
        case .noInternetConnection:
            return .noInternetConnection
        case .serializationFailed:
            return .serializationFailed
        case .other:
            return .other
        case .🔥:
            return .🔥
        case .unspecified:
            return .unspecified
        case .protocolNotHttps:
            return .protocolNotHttps
        case .sessionRequired:
            return .sessionRequired
        case .loginRequired:
            return .loginRequired
        case .recordingRequired:
            return .recordingRequired
        case .invalidRecording:
            return .invalidRecording
        case .zattooMaintenance:
            return .zattooMaintenance
        case .appVersionIsTooOld:
            return .appVersionIsTooOld
        case .localeNotSupported:
            return .localeNotSupported
        case .invalidAccountToken:
            return .invalidAccountToken
        case .serviceServerCouldNotBeContacted:
            return .serviceServerCouldNotBeContacted
        case .missingAppId:
            return .missingAppId
        case .invalidAppId:
            return .invalidAppId
        case .missingUUID:
            return .missingUUID
        case .missingLang:
            return .missingLang
        case .invalidLang:
            return .invalidLang
        case .invalidFormat:
            return .invalidFormat
        case .invalidLiveThumbsString:
            return .invalidLiveThumbsString
        case .invalidProgramThumbsString:
            return .invalidProgramThumbsString
        case .invalidSeasonNumber:
            return .invalidSeasonNumber
        case .invalidSessionToken:
            return .invalidSessionToken
        case .missingOrInvalidLoginOrPassword:
            return .missingOrInvalidLoginOrPassword
        case .accountManagementServerUnreachable:
            return .accountManagementServerUnreachable
        case .zattooAccountCouldNotBeCreatedOrUpdated:
            return .zattooAccountCouldNotBeCreatedOrUpdated
        case .missingOrInvalidCredentialsOrAccountInformation:
            return .missingOrInvalidCredentialsOrAccountInformation
        case .appIdZapiBaseHostNameUrlMismatch:
            return .appIdZapiBaseHostNameUrlMismatch
        case .zuyaServerFailed:
            return .zuyaServerFailed
        case .tooManyLoginAttempts:
            return .tooManyLoginAttempts
        case .missingPin:
            return .missingPin
        case .invalidPin:
            return .invalidPin
        case .invalidPinConfig:
            return .invalidPinConfig
        case .pinLocked:
            return .pinLocked
        case .purchaseBlocked:
            return .purchaseBlocked
        case .invalidStreamType:
            return .invalidStreamType
        case .addingLotsOfSeriesRecordingWarning:
            return .other
        case .invalidChannelId:
            return .invalidChannelId
        case .subscriptionRequiredToWatchContentFromThisChannel:
            return .subscriptionRequiredToWatchContentFromThisChannel
        case .missingRecordingId:
            return .missingRecordingId
        case .invalidRecordingId:
            return .invalidRecordingId
        case .playlistIsFull:
            return .playlistIsFull
        case .invalidConnectivity:
            return .invalidConnectivity
        case .internalNetworkRequired:
            return.internalNetworkRequired
        case .userIsNotCurrentlyRecordingThisTvSeries:
            return .userIsNotCurrentlyRecordingThisTvSeries
        case .missingTeasableId:
            return .missingTeasableId
        case .missingTesableType:
            return .missingTesableType
        case .invalidTeasableId:
            return .invalidTeasableId
        case .invalidTeasableType:
            return .invalidTeasableType
        case .teasableNotFound:
            return .teasableNotFound
        case .contentWasAlreadyOrdered:
            return .contentWasAlreadyOrdered
        case .orderNotFound:
            return .orderNotFound
        }
    }
}
