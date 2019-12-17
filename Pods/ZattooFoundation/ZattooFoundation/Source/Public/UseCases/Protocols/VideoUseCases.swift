//
//  VideoUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/13/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


public protocol VideoUseCases {

    var preferredPeakBitRate: BitRate { get set }
    
    func liveStream(channel: ChannelId,
                    qualityLevel: QualityLevel?,
                    drmRequired: Bool,
                    castDrmStreamType: StreamType,
                    isPreview: Bool,
                    pin: String?,
                    success: @escaping (Stream) -> Void,
                    protected: @escaping (YouthProtected) -> Void,
                    failure: @escaping (Error) -> Void)
    
    func registerTimeshift(channel: ChannelId,
                           success: @escaping (RegisterTimeshift) -> Void,
                           failure: @escaping (Error) -> Void)
    
    func timeshiftStream(channel: ChannelId,
                         qualityLevel: QualityLevel?,
                         resumeTime: Date,
                         drmRequired: Bool,
                         castDrmStreamType: StreamType,
                         isPreview: Bool,
                         pin: String?,
                         success: @escaping (Stream) -> Void,
                         protected: @escaping (YouthProtected) -> Void,
                         failure: @escaping (Error) -> Void)
    
    func recallStream(channel: ChannelId,
                      qualityLevel: QualityLevel?,
                      program: ProgramId,
                      drmRequired: Bool,
                      castDrmStreamType: StreamType,
                      isPreview: Bool,
                      pin: String?,
                      success: @escaping (Stream) -> Void,
                      protected: @escaping (YouthProtected) -> Void,
                      failure: @escaping (Error) -> Void)
    
    func recordingStream(recording: RecordingId,
                         qualityLevel: QualityLevel?,
                         drmRequired: Bool,
                         castDrmStreamType: StreamType,
                         isPreview: Bool,
                         pin: String?,
                         success: @escaping (Stream) -> Void,
                         protected: @escaping (YouthProtected) -> Void,
                         failure: @escaping (Error) -> Void)
    
    func tvodStream(vodToken: VodToken,
                    drmRequired: Bool,
                    castDrmStreamType: StreamType,
                    isPreview: Bool,
                    pin: String?,
                    success: @escaping (Stream) -> Void,
                    protected: @escaping (YouthProtected) -> Void,
                    failure: @escaping (Error) -> Void)
    
    func avodStream(vodToken: VodToken,
                    drmRequired: Bool,
                    castDrmStreamType: StreamType,
                    isPreview: Bool,
                    pin: String?,
                    success: @escaping (Stream) -> Void,
                    protected: @escaping (YouthProtected) -> Void,
                    failure: @escaping (Error) -> Void)

    func vodVideoStream(vod: Vod,
                        castDrmStreamType: StreamType,
                        isPreview: Bool,
                        pin: String?,
                        success: @escaping (Stream) -> Void,
                        protected: @escaping (YouthProtected) -> Void,
                        failure: @escaping (Error) -> Void)

    func vodTrailerStream(vod: Vod,
                          castDrmStreamType: StreamType,
                          isPreview: Bool,
                          pin: String?,
                          success: @escaping (Stream) -> Void,
                          protected: @escaping (YouthProtected) -> Void,
                          failure: @escaping (Error) -> Void)
    
    func stop(stream: Stream)

    func trickPlay(fromStream stream: URL,
                   success: @escaping (URL) -> Void,
                   failure: @escaping (Error) -> Void)
}
