//
//  ZattooVideoUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/13/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


public struct ZattooVideoUseCases: VideoUseCases {
    
    private let sessionRepository: SessionRepository
    private let videoRepository: VideoRepository
    private let vodRepository: VodRepository
    private let reachability: Reachable?
    private let userDefaults: UserDefaults

    private var preferredPeakBitRateKey: String {
        if let reachability = reachability, reachability.isReachableViaWiFi {
            return "zattoo.maxratebitratewifi"
        } else {
            return "zattoo.maxrate"
        }
    }
    
    // MARK: - Initializers
    
    public init() {
        self.init(
            sessionRepository: ZattooSessionRepository(),
            videoRepository: ZattooVideoRepository(),
            vodRepository: ZattooVodRepository()
        )
    }
    
    init(sessionRepository: SessionRepository,
         videoRepository: VideoRepository,
         vodRepository: VodRepository,
         reachability: Reachable? = ZattooConfiguration.shared.reachability,
         userDefaults: UserDefaults = .standard) {
        self.sessionRepository = sessionRepository
        self.videoRepository = videoRepository
        self.vodRepository = vodRepository
        self.reachability = reachability
        self.userDefaults = userDefaults
    }

    public var preferredPeakBitRate: BitRate {
        get {
            return BitRate(kbps: userDefaults.double(forKey: preferredPeakBitRateKey))
        }

        nonmutating set {
            userDefaults.set(newValue.kbps, forKey: preferredPeakBitRateKey)
        }
    }

    // MARK: - VideoRepository
    
    public func liveStream(channel: ChannelId,
                           qualityLevel: QualityLevel?,
                           drmRequired: Bool,
                           castDrmStreamType: StreamType,
                           isPreview: Bool,
                           pin: String?,
                           success: @escaping (Stream) -> Void,
                           protected: @escaping (YouthProtected) -> Void,
                           failure: @escaping (Error) -> Void) {
        
        videoRepository.liveStream(
            channel: channel,
            qualityLevel: (qualityLevel != nil) ? QualityLevelModel(rawValue: qualityLevel!.rawValue) : nil,
            drmRequired: drmRequired,
            castDrmStreamType: castDrmStreamType,
            isPreview: isPreview,
            pin: pin,
            success: { success($0.DTO) },
            protected: { protected($0.DTO) },
            failure: { failure($0.DTO) })
    }
    
    
    public func registerTimeshift(channel: ChannelId,
                                  success: @escaping (RegisterTimeshift) -> Void,
                                  failure: @escaping (Error) -> Void) {
        
        videoRepository.registerTimeshift(
            channel: channel,
            success: { success($0.DTO) },
            failure: { failure($0.DTO) }
        )
    }
    
    public func timeshiftStream(channel: ChannelId,
                                qualityLevel: QualityLevel?,
                                resumeTime: Date,
                                drmRequired: Bool,
                                castDrmStreamType: StreamType,
                                isPreview: Bool,
                                pin: String?,
                                success: @escaping (Stream) -> Void,
                                protected: @escaping (YouthProtected) -> Void,
                                failure: @escaping (Error) -> Void) {
        
        videoRepository.timeshiftStream(
            channel: channel,
            qualityLevel: (qualityLevel != nil) ? QualityLevelModel(rawValue: qualityLevel!.rawValue) : nil,
            resumeTime: resumeTime,
            drmRequired: drmRequired,
            castDrmStreamType: castDrmStreamType,
            isPreview: isPreview,
            pin: pin,
            success: { success($0.DTO) },
            protected: { protected($0.DTO) },
            failure: { failure($0.DTO) })
    }

    public func recallStream(channel: ChannelId,
                             qualityLevel: QualityLevel?,
                             program: ProgramId,
                             drmRequired: Bool,
                             castDrmStreamType: StreamType,
                             isPreview: Bool,
                             pin: String?,
                             success: @escaping (Stream) -> Void,
                             protected: @escaping (YouthProtected) -> Void,
                             failure: @escaping (Error) -> Void) {
        
        sessionRepository.session(
            success: {
                session in
                if session.isSelectiveRecallEligible {
                    self.videoRepository.selectiveRecallStream(channel: channel,
                                                               qualityLevel: (qualityLevel != nil) ? QualityLevelModel(rawValue: qualityLevel!.rawValue) : nil,
                                                               program: program,
                                                               drmRequired: drmRequired,
                                                               castDrmStreamType: castDrmStreamType,
                                                               isPreview: isPreview,
                                                               pin: pin,
                                                               success: { success($0.DTO) },
                                                               protected: { protected($0.DTO) },
                                                               failure: { failure($0.DTO) })
                } else {
                    self.videoRepository.recallStream(channel: channel,
                                                      qualityLevel: (qualityLevel != nil) ? QualityLevelModel(rawValue: qualityLevel!.rawValue) : nil,
                                                      program: program,
                                                      drmRequired: drmRequired,
                                                      castDrmStreamType: castDrmStreamType,
                                                      isPreview: isPreview,
                                                      pin: pin,
                                                      success: { success($0.DTO) },
                                                      protected: { protected($0.DTO) },
                                                      failure: { failure($0.DTO) })
                }
        },
            failure: { failure ($0.DTO) }
        )
    }
    
    
    public func recordingStream(recording: RecordingId,
                                qualityLevel: QualityLevel?,
                                drmRequired: Bool,
                                castDrmStreamType: StreamType,
                                isPreview: Bool,
                                pin: String?,
                                success: @escaping (Stream) -> Void,
                                protected: @escaping (YouthProtected) -> Void,
                                failure: @escaping (Error) -> Void) {
        
        videoRepository.recordingStream(
            recording: recording,
            qualityLevel: (qualityLevel != nil) ? QualityLevelModel(rawValue: qualityLevel!.rawValue) : nil,
            drmRequired: drmRequired,
            castDrmStreamType: castDrmStreamType,
            isPreview: isPreview,
            pin: pin,
            success: { success($0.DTO) },
            protected: { protected($0.DTO) },
            failure: { failure($0.DTO) })
    }
    
    public func tvodStream(vodToken: VodToken,
                           drmRequired: Bool,
                           castDrmStreamType: StreamType,
                           isPreview: Bool,
                           pin: String?,
                           success: @escaping (Stream) -> Void,
                           protected: @escaping (YouthProtected) -> Void,
                           failure: @escaping (Error) -> Void) {
        
        sessionRepository.session(
            success: {
                session in
                guard let provider = session.vodProviders.first else { return }
                self.videoRepository.tvodStream(vodToken: vodToken,
                                                drmRequired: drmRequired,
                                                castDrmStreamType: castDrmStreamType,
                                                isPreview: isPreview,
                                                pin: pin,
                                                provider: provider,
                                                success: { success($0.DTO) },
                                                protected: { protected($0.DTO) },
                                                failure: { failure($0.DTO) })
        },
            failure: { failure ($0.DTO) }
        )
        
    }
    
    public func avodStream(vodToken: VodToken,
                           drmRequired: Bool,
                           castDrmStreamType: StreamType,
                           isPreview: Bool,
                           pin: String?,
                           success: @escaping (Stream) -> Void,
                           protected: @escaping (YouthProtected) -> Void,
                           failure: @escaping (Error) -> Void) {
        
        videoRepository.avodStream(vodToken: vodToken,
                                   drmRequired: drmRequired,
                                   castDrmStreamType: castDrmStreamType,
                                   isPreview: isPreview,
                                   pin: pin,
                                   success: { success($0.DTO) },
                                   protected: { protected($0.DTO) },
                                   failure: { failure($0.DTO) })
        
    }

    public func vodVideoStream(vod: Vod,
                               castDrmStreamType: StreamType,
                               isPreview: Bool,
                               pin: String?,
                               success: @escaping (Stream) -> Void,
                               protected: @escaping (YouthProtected) -> Void,
                               failure: @escaping (Error) -> Void) {

        vodRepository.vodStatuses(
            success: {
                vodStatusesModel in
                let vodStatuses = vodStatusesModel.DTO
                let termToken: String
                let qualityLevel: QualityLevel
                let isDrmRequired: Bool

                if case .subscribed(let sku, _)? = vodStatuses.orderedState(for: vod), let term = vod.svodTerms.first(where: { $0.subscriptionSku == sku }) {
                    termToken = term.token
                    qualityLevel = term.quality
                    isDrmRequired = term.isDrmRequired
                }
                else if let vodStatus = vodStatuses.orderedStatus(for: vod) {
                    termToken = vodStatus.termToken
                    qualityLevel = vodStatus.qualityLevel
                    isDrmRequired = vodStatus.isDrmRequired
                }
                else {
                    return failure(Error(code: .orderNotFound))
                }
                self.videoRepository.vodVideoStream(
                    id: vod.id,
                    teasableType: vod.teasableType.model,
                    termToken: termToken,
                    drmRequired: isDrmRequired,
                    qualityLevel: QualityLevelModel(rawValue: qualityLevel.rawValue),
                    castDrmStreamType: castDrmStreamType,
                    isPreview: isPreview,
                    pin: pin,
                    success: { success($0.DTO) },
                    protected: { protected($0.DTO) },
                    failure: { failure($0.DTO) }
                )
        }, failure: { failure($0.DTO) })
    }

    public func vodTrailerStream(vod: Vod,
                                 castDrmStreamType: StreamType,
                                 isPreview: Bool,
                                 pin: String?,
                                 success: @escaping (Stream) -> Void,
                                 protected: @escaping (YouthProtected) -> Void,
                                 failure: @escaping (Error) -> Void) {

        videoRepository.vodTrailerStream(
            id: vod.id,
            teasableType: vod.teasableType.model,
            castDrmStreamType: castDrmStreamType,
            isPreview: isPreview,
            pin: pin,
            success: { success($0.DTO) },
            protected: { protected($0.DTO) },
            failure: { failure($0.DTO) }
        )
    }
    
    public func stop(stream: Stream) {
        guard let stopUrl = stream.stopUrl else { return }
        videoRepository.stopStream(with: stopUrl)
    }

    public func trickPlay(fromStream stream: URL,
                          success: @escaping (URL) -> Void,
                          failure: @escaping (Error) -> Void) {

        videoRepository.trickPlay(
            fromStream: stream,
            success: {
                trickPlayURL in

                let baseURL = stream.deletingLastPathComponent()

                var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
                components?.query = nil

                if let componentsURL = components?.url,
                    let composedURL = URL(string: "\(componentsURL)\(trickPlayURL.absoluteString)") {
                    success(composedURL)
                }
                else {
                    failure(Error(code: .unexpectedError))
                }

            },
            failure: { failure ($0.DTO) })
    }
}
