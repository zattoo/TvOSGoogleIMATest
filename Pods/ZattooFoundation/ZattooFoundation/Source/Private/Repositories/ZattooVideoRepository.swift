//
//  ZattooVideoRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/14/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ZattooVideoRepository: VideoRepository {
    private let networkDataSource: VideoNetworkDataSource
        
    // MARK: - Initializers
    
    init(networkDataSource: VideoNetworkDataSource = ZattooVideoNetworkDataSource()) {
        self.networkDataSource = networkDataSource
    }
    
    // MARK: - VideoRepository
    
    func liveStream(channel: ChannelId,
                    qualityLevel: QualityLevelModel?,
                    drmRequired: Bool,
                    castDrmStreamType: StreamType,
                    isPreview: Bool,
                    pin: String?,
                    success: @escaping (StreamModel) -> Void,
                    protected: @escaping (YouthProtectedModel) -> Void,
                    failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.liveStream(
            channel: channel,
            qualityLevel: QualityLevelEntity(rawValue: qualityLevel?.rawValue ?? ""),
            drmRequired: drmRequired,
            castDrmStreamType: castDrmStreamType,
            isPreview: isPreview,
            pin: pin,
            success: {
                streamEntity in
                success(streamEntity.model)
                self.networkDataSource.track(streamEntity.trackingUrls)
            },
            failure: {
                if $0.isPinProtected {
                    self.watchCallProtected(error: $0, protected: protected)
                }
                else {
                    failure($0.model)
                }
        })
    }
    
    func registerTimeshift(channel: ChannelId,
                           success: @escaping (RegisterTimeshiftModel) -> Void,
                           failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.registerTimeshift(
            channel: channel,
            success: { success($0.model) },
            failure: { failure($0.model) })
    }
    
    func timeshiftStream(channel: ChannelId,
                         qualityLevel: QualityLevelModel?,
                         resumeTime: Date,
                         drmRequired: Bool,
                         castDrmStreamType: StreamType,
                         isPreview: Bool,
                         pin: String?,
                         success: @escaping (StreamModel) -> Void,
                         protected: @escaping (YouthProtectedModel) -> Void,
                         failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.timeshiftStream(
            channel: channel,
            qualityLevel: QualityLevelEntity(rawValue: qualityLevel?.rawValue ?? ""),
            resumeTime: resumeTime,
            drmRequired: drmRequired,
            castDrmStreamType: castDrmStreamType,
            isPreview: isPreview,
            pin: pin,
            success: {
                streamEntity in
                success(streamEntity.model)
                self.networkDataSource.track(streamEntity.trackingUrls)
            },
            failure: {
                if $0.isPinProtected {
                    self.watchCallProtected(error: $0, protected: protected)
                }
                else {
                    failure($0.model)
                }
        })
    }
    
    func recallStream(channel: ChannelId,
                      qualityLevel: QualityLevelModel?,
                      program: ProgramId,
                      drmRequired: Bool,
                      castDrmStreamType: StreamType,
                      isPreview: Bool,
                      pin: String?,
                      success: @escaping (StreamModel) -> Void,
                      protected: @escaping (YouthProtectedModel) -> Void,
                      failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.recallStream(channel: channel,
                                       qualityLevel: QualityLevelEntity(rawValue: qualityLevel?.rawValue ?? ""),
                                       program: program,
                                       drmRequired: drmRequired,
                                       castDrmStreamType: castDrmStreamType,
                                       isPreview: isPreview,
                                       pin: pin,
                                       success: {
                                        streamEntity in
                                        success(streamEntity.model)
                                        self.networkDataSource.track(streamEntity.trackingUrls)
                                        },
                                       failure: {
                                        if $0.isPinProtected {
                                            self.watchCallProtected(error: $0, protected: protected)
                                        }
                                        else {
                                            failure($0.model)
                                        }
        })
    }
    
    func selectiveRecallStream(channel: ChannelId,
                               qualityLevel: QualityLevelModel?,
                               program: ProgramId,
                               drmRequired: Bool,
                               castDrmStreamType: StreamType,
                               isPreview: Bool,
                               pin: String?,
                               success: @escaping (StreamModel) -> Void,
                               protected: @escaping (YouthProtectedModel) -> Void,
                               failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.selectiveRecallStream(channel: channel,
                                                qualityLevel: QualityLevelEntity(rawValue: qualityLevel?.rawValue ?? ""),
                                                program: program,
                                                drmRequired: drmRequired,
                                                castDrmStreamType: castDrmStreamType,
                                                isPreview: isPreview,
                                                pin: pin,
                                                success: {
                                                    streamEntity in
                                                    success(streamEntity.model)
                                                    self.networkDataSource.track(streamEntity.trackingUrls)
                                                },
                                                failure: {
                                                    if $0.isPinProtected {
                                                        self.watchCallProtected(error: $0, protected: protected)
                                                    }
                                                    else {
                                                        failure($0.model)
                                                    }
        })
    }
    
    func recordingStream(recording: RecordingId,
                         qualityLevel: QualityLevelModel?,
                         drmRequired: Bool,
                         castDrmStreamType: StreamType,
                         isPreview: Bool,
                         pin: String?,
                         success: @escaping (StreamModel) -> Void,
                         protected: @escaping (YouthProtectedModel) -> Void,
                         failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.recordingStream(
            recording: recording,
            qualityLevel: QualityLevelEntity(rawValue: qualityLevel?.rawValue ?? ""),
            drmRequired: drmRequired,
            castDrmStreamType: castDrmStreamType,
            isPreview: isPreview,
            pin: pin,
            success: {
                streamEntity in
                success(streamEntity.model)
                self.networkDataSource.track(streamEntity.trackingUrls)
            },
            failure: {
                if $0.isPinProtected {
                    self.watchCallProtected(error: $0, protected: protected)
                }
                else {
                    failure($0.model)
                }
            })
    }
    
    func tvodStream(vodToken: VodToken,
                    drmRequired: Bool,
                    castDrmStreamType: StreamType,
                    isPreview: Bool,
                    pin: String?,
                    provider: String,
                    success: @escaping (StreamModel) -> Void,
                    protected: @escaping (YouthProtectedModel) -> Void,
                    failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.tvodStream(vodToken: vodToken,
                                     drmRequired: drmRequired,
                                     castDrmStreamType: castDrmStreamType,
                                     isPreview: isPreview,
                                     pin: pin,
                                     provider: provider,
                                     success: {
                                        streamEntity in
                                        success(streamEntity.model)
                                        self.networkDataSource.track(streamEntity.trackingUrls)
                                     },
                                     failure: {
                                        if $0.isPinProtected {
                                            self.watchCallProtected(error: $0, protected: protected)
                                        }
                                        else {
                                            failure($0.model)
                                        }
                                     })
    }
    
    func avodStream(vodToken: VodToken,
                    drmRequired: Bool,
                    castDrmStreamType: StreamType,
                    isPreview: Bool,
                    pin: String?,
                    success: @escaping (StreamModel) -> Void,
                    protected: @escaping (YouthProtectedModel) -> Void,
                    failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.avodStream(vodToken: vodToken,
                                     drmRequired: drmRequired,
                                     castDrmStreamType: castDrmStreamType,
                                     isPreview: isPreview,
                                     pin: pin,
                                     success: {
                                        streamEntity in
                                        success(streamEntity.model)
                                        self.networkDataSource.track(streamEntity.trackingUrls)
                                     },
                                     failure: {
                                        if $0.isPinProtected {
                                            self.watchCallProtected(error: $0, protected: protected)
                                        }
                                        else {
                                            failure($0.model)
                                        }
                                     })
    }

    func vodVideoStream(id: TeasableId,
                        teasableType: TeasableTypeModel,
                        termToken: String,
                        drmRequired: Bool,
                        qualityLevel: QualityLevelModel?,
                        castDrmStreamType: StreamType,
                        isPreview: Bool,
                        pin: String?,
                        success: @escaping (StreamModel) -> Void,
                        protected: @escaping (YouthProtectedModel) -> Void,
                        failure: @escaping (ErrorModel) -> Void) {

        networkDataSource.vodVideoStream(
            id: id,
            teasableType: teasableType.entity,
            termToken: termToken,
            drmRequired: drmRequired,
            qualityLevel: QualityLevelEntity(rawValue: qualityLevel?.rawValue ?? ""),
            castDrmStreamType: castDrmStreamType,
            isPreview: isPreview,
            pin: pin,
            success: {
                entity in
                self.networkDataSource.track(entity.trackingUrls)
                success(entity.model)
        }, failure: {
            error in
            if error.isPinProtected {
                self.watchCallProtected(error: error, protected: protected)
            }
            else {
                failure(error.model)
            }
        })
    }

    func vodTrailerStream(id: TeasableId,
                          teasableType: TeasableTypeModel,
                          castDrmStreamType: StreamType,
                          isPreview: Bool,
                          pin: String?,
                          success: @escaping (StreamModel) -> Void,
                          protected: @escaping (YouthProtectedModel) -> Void,
                          failure: @escaping (ErrorModel) -> Void) {

        networkDataSource.vodTrailerStream(
            id: id,
            teasableType: teasableType.entity,
            castDrmStreamType: castDrmStreamType,
            isPreview: isPreview,
            pin: pin,
            success: {
                entity in
                self.networkDataSource.track(entity.trackingUrls)
                success(entity.model)
        }, failure: {
            error in
            if error.isPinProtected {
                self.watchCallProtected(error: error, protected: protected)
            }
            else {
                failure(error.model)
            }
        })
    }
    
    func stopStream(with stopUrl: URL) {
        networkDataSource.stopStream(with: stopUrl)
    }

    func trickPlay(fromStream stream: URL,
                   success: @escaping (URL) -> Void,
                   failure: @escaping (ErrorModel) -> Void) {

        networkDataSource.trickPlay(
            fromStream: stream,
            success: success,
            failure: { failure($0.model) })
    }

    // MARK: - Private
    
    private func watchCallProtected(error: WatchNetworkEntityError,
                                    protected: @escaping (YouthProtectedModel) -> Void) {
        
        switch error.code {
        case .missingPin:
            protected(YouthProtectedModel(state: .missingPin, attemptsLeft: error.attemptsLeft, pinRequiredUntil: error.pinRequiredUntil))
        case .invalidPin:
            protected(YouthProtectedModel(state: .invalidPin, attemptsLeft: error.attemptsLeft, pinRequiredUntil: nil))
        case .pinLocked:
            protected(YouthProtectedModel(state: .pinLocked, lockedUntil: error.lockedUntil))

        default:
            return
        }
    }
}
