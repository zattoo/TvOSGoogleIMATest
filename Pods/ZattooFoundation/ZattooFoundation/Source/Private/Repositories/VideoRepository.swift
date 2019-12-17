//
//  VideoRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/14/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol VideoRepository {
    
    func liveStream(channel: ChannelId,
                    qualityLevel: QualityLevelModel?,
                    drmRequired: Bool,
                    castDrmStreamType: StreamType,
                    isPreview: Bool,
                    pin: String?,
                    success: @escaping (StreamModel) -> Void,
                    protected: @escaping (YouthProtectedModel) -> Void,
                    failure: @escaping (ErrorModel) -> Void)
    
    func registerTimeshift(channel: ChannelId,
                           success: @escaping (RegisterTimeshiftModel) -> Void,
                           failure: @escaping (ErrorModel) -> Void)
    
    func timeshiftStream(channel: ChannelId,
                         qualityLevel: QualityLevelModel?,
                         resumeTime: Date,
                         drmRequired: Bool,
                         castDrmStreamType: StreamType,
                         isPreview: Bool,
                         pin: String?,
                         success: @escaping (StreamModel) -> Void,
                         protected: @escaping (YouthProtectedModel) -> Void,
                         failure: @escaping (ErrorModel) -> Void)
    
    func recallStream(channel: ChannelId,
                      qualityLevel: QualityLevelModel?,
                      program: ProgramId,
                      drmRequired: Bool,
                      castDrmStreamType: StreamType,
                      isPreview: Bool,
                      pin: String?,
                      success: @escaping (StreamModel) -> Void,
                      protected: @escaping (YouthProtectedModel) -> Void,
                      failure: @escaping (ErrorModel) -> Void)
    
    func selectiveRecallStream(channel: ChannelId,
                               qualityLevel: QualityLevelModel?,
                               program: ProgramId,
                               drmRequired: Bool,
                               castDrmStreamType: StreamType,
                               isPreview: Bool,
                               pin: String?,
                               success: @escaping (StreamModel) -> Void,
                               protected: @escaping (YouthProtectedModel) -> Void,
                               failure: @escaping (ErrorModel) -> Void)
    
    func recordingStream(recording: RecordingId,
                         qualityLevel: QualityLevelModel?,
                         drmRequired: Bool,
                         castDrmStreamType: StreamType,
                         isPreview: Bool,
                         pin: String?,
                         success: @escaping (StreamModel) -> Void,
                         protected: @escaping (YouthProtectedModel) -> Void,
                         failure: @escaping (ErrorModel) -> Void)
    
    func tvodStream(vodToken: VodToken,
                    drmRequired: Bool,
                    castDrmStreamType: StreamType,
                    isPreview: Bool,
                    pin: String?,
                    provider: String,
                    success: @escaping (StreamModel) -> Void,
                    protected: @escaping (YouthProtectedModel) -> Void,
                    failure: @escaping (ErrorModel) -> Void)
    
    func avodStream(vodToken: VodToken,
                    drmRequired: Bool,
                    castDrmStreamType: StreamType,
                    isPreview: Bool,
                    pin: String?,
                    success: @escaping (StreamModel) -> Void,
                    protected: @escaping (YouthProtectedModel) -> Void,
                    failure: @escaping (ErrorModel) -> Void)

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
                        failure: @escaping (ErrorModel) -> Void)

    func vodTrailerStream(id: TeasableId,
                          teasableType: TeasableTypeModel,
                          castDrmStreamType: StreamType,
                          isPreview: Bool,
                          pin: String?,
                          success: @escaping (StreamModel) -> Void,
                          protected: @escaping (YouthProtectedModel) -> Void,
                          failure: @escaping (ErrorModel) -> Void)

    func stopStream(with stopUrl: URL)

    func trickPlay(fromStream stream: URL,
                   success: @escaping (URL) -> Void,
                   failure: @escaping (ErrorModel) -> Void)
}
