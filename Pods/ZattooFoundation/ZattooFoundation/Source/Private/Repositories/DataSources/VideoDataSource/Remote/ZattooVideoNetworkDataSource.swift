//
//  ZattooVideoNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/14/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire


struct ZattooVideoNetworkDataSource: VideoNetworkDataSource {
    
    private let manager: SessionManager
    private let reachability: Reachable?
    
    init(manager: SessionManager = SessionManager.shared,
         reachability: Reachable? = ZattooConfiguration.shared.reachability) {
        self.manager = manager
        self.reachability = reachability
    }
    
    // MARK: - VideoNetworkDataSource
    
    func liveStream(channel: ChannelId,
                    qualityLevel: QualityLevelEntity?,
                    drmRequired: Bool,
                    castDrmStreamType: StreamType,
                    isPreview: Bool,
                    pin: String?,
                    success: @escaping (StreamEntity) -> Void,
                    failure: @escaping (WatchNetworkEntityError) -> Void) {
        
        var parameters = watchParameters(isDrmRequired: drmRequired, castDrmStreamType: castDrmStreamType, isPreview: isPreview, youthPIN: pin, qualityLevel: qualityLevel)
        
        parameters["timeshift"] = 3600
        
        watchCall(withParameters: parameters, type: .watchLive(channel: channel), success: success, failure: failure)
    }
    
    func registerTimeshift(channel: ChannelId,
                           success: @escaping (RegisterTimeshiftEntity) -> Void,
                           failure: @escaping (NetworkEntityError) -> Void) {
        
        manager.request(endpoint: .registerTimeshift(channel: channel))
            .responseObject(errorEntity: NetworkEntityError.self) {
                (_, _, result: Result<ZattooRegisterTimeshiftResponse>) in
                
                switch result {
                case .success(let response):
                    success(response.registerTimeshift)
                case .failure(let errorEntity):
                    guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                    failure(errorEntity)
                }
        }
    }
    
    func timeshiftStream(channel: ChannelId,
                         qualityLevel: QualityLevelEntity?,
                         resumeTime: Date,
                         drmRequired: Bool,
                         castDrmStreamType: StreamType,
                         isPreview: Bool,
                         pin: String?,
                         success: @escaping (StreamEntity) -> Void,
                         failure: @escaping (WatchNetworkEntityError) -> Void) {
        
        var parameters = watchParameters(isDrmRequired: drmRequired, castDrmStreamType: castDrmStreamType, isPreview: isPreview, youthPIN: pin, qualityLevel: qualityLevel)
        parameters["resume_time"] = Int(resumeTime.timeIntervalSince1970)
        watchCall(withParameters: parameters, type: .watchTimeshift(channel: channel), success: success, failure: failure)
    }
    
    func recallStream(channel: ChannelId,
                      qualityLevel: QualityLevelEntity?,
                      program: ProgramId,
                      drmRequired: Bool,
                      castDrmStreamType: StreamType,
                      isPreview: Bool,
                      pin: String?,
                      success: @escaping (StreamEntity) -> Void,
                      failure: @escaping (WatchNetworkEntityError) -> Void) {
        
        recall(type: .watchRecall(channel: channel, program: program), qualityLevel: qualityLevel, drmRequired: drmRequired, castDrmStreamType: castDrmStreamType, isPreview: isPreview, pin: pin, success: success, failure: failure)
    }
    
    func selectiveRecallStream(channel: ChannelId,
                               qualityLevel: QualityLevelEntity?,
                               program: ProgramId,
                               drmRequired: Bool,
                               castDrmStreamType: StreamType,
                               isPreview: Bool,
                               pin: String?,
                               success: @escaping (StreamEntity) -> Void,
                               failure: @escaping (WatchNetworkEntityError) -> Void) {
        
        recall(type: .selectiveRecall(channel: channel, program: program), qualityLevel: qualityLevel, drmRequired: drmRequired, castDrmStreamType: castDrmStreamType, isPreview: isPreview, pin: pin, success: success, failure: failure)
    }
    
    func recordingStream(recording: RecordingId,
                         qualityLevel: QualityLevelEntity?,
                         drmRequired: Bool,
                         castDrmStreamType: StreamType,
                         isPreview: Bool,
                         pin: String?,
                         success: @escaping (StreamEntity) -> Void,
                         failure: @escaping (WatchNetworkEntityError) -> Void) {
        
        let parameters = watchParameters(isDrmRequired: drmRequired, castDrmStreamType: castDrmStreamType, isPreview: isPreview, youthPIN: pin, qualityLevel: qualityLevel)
        watchCall(withParameters: parameters,
                  type: .watchRecording(recording: recording),
                  success: success,
                  failure: failure)
    }
    
    func tvodStream(vodToken: VodToken,
                    drmRequired: Bool,
                    castDrmStreamType: StreamType,
                    isPreview: Bool,
                    pin: String?,
                    provider: String,
                    success: @escaping (StreamEntity) -> Void,
                    failure: @escaping (WatchNetworkEntityError) -> Void) {
        
        let parameters = watchParameters(isDrmRequired: drmRequired, castDrmStreamType: castDrmStreamType, isPreview: isPreview, youthPIN: pin, qualityLevel: nil)
        watchCall(withParameters: parameters,
                  type: .watchTvod(token: vodToken, provider: provider),
                  success: success,
                  failure: failure)
    }
    
    func avodStream(vodToken: VodToken,
                    drmRequired: Bool,
                    castDrmStreamType: StreamType,
                    isPreview: Bool,
                    pin: String?,
                    success: @escaping (StreamEntity) -> Void,
                    failure: @escaping (WatchNetworkEntityError) -> Void) {
        
        let parameters = watchParameters(isDrmRequired: drmRequired, castDrmStreamType: castDrmStreamType, isPreview: isPreview, youthPIN: pin, qualityLevel: nil)
        watchCall(withParameters: parameters,
                  type: .watchAvod(token: vodToken),
                  success: success,
                  failure: failure)
    }

    func vodVideoStream(id: TeasableId,
                        teasableType: TeasableTypeEntity,
                        termToken: String,
                        drmRequired: Bool,
                        qualityLevel: QualityLevelEntity?,
                        castDrmStreamType: StreamType,
                        isPreview: Bool,
                        pin: String?,
                        success: @escaping (StreamEntity) -> Void,
                        failure: @escaping (WatchNetworkEntityError) -> Void) {

        var parameters = watchParameters(
            isDrmRequired: drmRequired,
            castDrmStreamType: castDrmStreamType,
            isPreview: isPreview,
            youthPIN: pin,
            qualityLevel: qualityLevel
        )

        parameters["teasable_id"] = id
        parameters["teasable_type"] = teasableType.rawValue
        parameters["term_token"] = termToken

        watchCall(
            withParameters: parameters,
            type: .watchVodVideo,
            success: success,
            failure: failure
        )
    }

    func vodTrailerStream(id: TeasableId,
                          teasableType: TeasableTypeEntity,
                          castDrmStreamType: StreamType,
                          isPreview: Bool,
                          pin: String?,
                          success: @escaping (StreamEntity) -> Void,
                          failure: @escaping (WatchNetworkEntityError) -> Void) {

        var parameters = watchParameters(
            isDrmRequired: true,
            castDrmStreamType: castDrmStreamType,
            isPreview: isPreview,
            youthPIN: pin,
            qualityLevel: nil
        )

        parameters["teasable_id"] = id
        parameters["teasable_type"] = teasableType.rawValue

        watchCall(
            withParameters: parameters,
            type: .watchVodTrailer,
            success: success,
            failure: failure
        )
    }
    
    func stopStream(with stopUrl: URL) {
        manager.fire(stopUrl)
    }
    
    func track(_ urls: [URL]) {
        manager.fire(urls)
    }

    func trickPlay(fromStream stream: URL,
                   success: @escaping (URL) -> Void,
                   failure: @escaping (NetworkEntityError) -> Void) {

        manager.download(stream, to: DownloadRequest.suggestedDownloadDestination(for: .cachesDirectory)).response(completionHandler: {
            response in

            guard let fileUrl = response.destinationURL,
                let fileContent = try? String(contentsOf: fileUrl, encoding: .utf8) else { return }

            let regexMatches = Regex.matches(for: "#EXT-X-I-FRAME-STREAM-INF[^\n]*URI=\"([^\"]*)\"", in: fileContent)
            if !regexMatches.captures.isEmpty,
                let trickPlayURL = URL(string: regexMatches.captures[0]) {
                success(trickPlayURL)
            }
            else {
                failure(NetworkEntityError(code: .unspecified))
            }

            // cleanup
            try? FileManager.default.removeItem(at: fileUrl)
        })
    }

    func watchParameters(isDrmRequired: Bool, castDrmStreamType: StreamType, isPreview: Bool, youthPIN: String?, qualityLevel: QualityLevelEntity?) -> [String: Any] {
        var parameters: [String: String] = [:]

        if let qualityLevel = qualityLevel, qualityLevel == .uhd {
            parameters["stream_type"] = isDrmRequired ? StreamType.hls7Fairplay.rawValue : StreamType.hls7.rawValue
            parameters["quality"] = qualityLevel.rawValue
        } else {
            parameters["stream_type"] = isDrmRequired ? StreamType.hlsFairplay.rawValue : StreamType.hls.rawValue
        }

        #if os(iOS)
        parameters["https_watch_urls"] = "False"

        if let reachability = reachability, reachability.isReachableViaWiFi {
            parameters["wifi_or_better"] = "True"
        }
        else {
            parameters["wifi_or_better"] = "False"
        }

        if castDrmStreamType != .none {
            parameters["cast_stream_type"] = isDrmRequired ? castDrmStreamType.rawValue : StreamType.dash.rawValue
        }
        #else
        parameters["https_watch_urls"] = "True"
        parameters["wifi_or_better"] = "True"
        parameters["enable_eac3"] = "True"
        #endif
        
        if let youthPIN = youthPIN {
            parameters["youth_protection_pin"] = youthPIN
        }

        if isPreview {
            parameters["preview"] = "True"
        }
        
        return parameters
    }

    // MARK: - Private

    private func watchCall(withParameters parameters: [String: Any],
                           type: ZAPIEndpoint,
                           success: @escaping (StreamEntity) -> Void,
                           failure: @escaping (WatchNetworkEntityError) -> Void) {
        
        manager.request(endpoint: type, parameters: parameters).responseObject(errorEntity: WatchNetworkEntityError.self) {
            (_, _, result: Result<ZattooWatchResponse>) in
            
            switch result {
            case .success(let watchResponse):
                success(watchResponse.stream)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? WatchNetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    private func recall(type: ZAPIEndpoint,
                        qualityLevel: QualityLevelEntity?,
                        drmRequired: Bool,
                        castDrmStreamType: StreamType,
                        isPreview: Bool,
                        pin: String?,
                        success: @escaping (StreamEntity) -> Void,
                        failure: @escaping (WatchNetworkEntityError) -> Void) {
        
        var parameters = watchParameters(isDrmRequired: drmRequired, castDrmStreamType: castDrmStreamType, isPreview: isPreview, youthPIN: pin, qualityLevel: qualityLevel)

        parameters["event"] = "1"
        
        watchCall(withParameters: parameters, type: type, success: success, failure: failure)
    }
}
