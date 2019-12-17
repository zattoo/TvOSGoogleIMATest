//
//  VideoUseCases+DefaultParameters.swift
//  ZattooFoundation
//
//  Created by David Cordero on 24.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


public extension VideoUseCases {
    func liveStream(channel: ChannelId,
                    drmRequired: Bool = false,
                    castDrmStreamType: StreamType = .dashWidevine,
                    isPreview: Bool = false,
                    pin: String? = nil,
                    success: @escaping (Stream) -> Void,
                    protected: @escaping (YouthProtected) -> Void,
                    failure: @escaping (Error) -> Void) {
        
        liveStream(channel: channel,
                   qualityLevel: nil,
                   drmRequired: drmRequired,
                   castDrmStreamType: castDrmStreamType,
                   isPreview: isPreview,
                   pin: pin,
                   success: success,
                   protected: protected,
                   failure: failure)
    }
    
    
    func timeshiftStream(channel: ChannelId,
                         resumeTime: Date,
                         drmRequired: Bool = false,
                         castDrmStreamType: StreamType = .dashWidevine,
                         isPreview: Bool = false,
                         pin: String? = nil,
                         success: @escaping (Stream) -> Void,
                         protected: @escaping (YouthProtected) -> Void,
                         failure: @escaping (Error) -> Void) {
        
        timeshiftStream(channel: channel,
                        qualityLevel: nil,
                        resumeTime: resumeTime,
                        drmRequired: drmRequired,
                        castDrmStreamType: castDrmStreamType,
                        isPreview: isPreview,
                        pin: pin,
                        success: success,
                        protected: protected,
                        failure: failure)
        
    }
    
    
    func recallStream(channel: ChannelId,
                      program: ProgramId,
                      drmRequired: Bool = false,
                      castDrmStreamType: StreamType = .dashWidevine,
                      isPreview: Bool = false,
                      pin: String? = nil,
                      success: @escaping (Stream) -> Void,
                      protected: @escaping (YouthProtected) -> Void,
                      failure: @escaping (Error) -> Void) {
        
        recallStream(channel:channel,
                     qualityLevel: nil,
                     program: program,
                     drmRequired: drmRequired,
                     castDrmStreamType: castDrmStreamType,
                     isPreview: isPreview,
                     pin: pin,
                     success: success,
                     protected: protected,
                     failure: failure)
        
    }
    
    
    func recordingStream(recording: RecordingId,
                         drmRequired: Bool = false,
                         castDrmStreamType: StreamType = .dashWidevine,
                         isPreview: Bool = false,
                         pin: String? = nil,
                         success: @escaping (Stream) -> Void,
                         protected: @escaping (YouthProtected) -> Void,
                         failure: @escaping (Error) -> Void) {
        
        recordingStream(recording: recording,
                        qualityLevel: nil,
                        drmRequired: drmRequired,
                        castDrmStreamType: castDrmStreamType,
                        isPreview: isPreview,
                        pin: pin,
                        success: success,
                        protected: protected,
                        failure: failure)
        
    }
    
    func tvodStream(vodToken: VodToken,
                    drmRequired: Bool = true,
                    castDrmStreamType: StreamType = .dashWidevine,
                    isPreview: Bool = false,
                    pin: String? = nil,
                    success: @escaping (Stream) -> Void,
                    protected: @escaping (YouthProtected) -> Void,
                    failure: @escaping (Error) -> Void) {
        
        tvodStream(vodToken: vodToken,
                   drmRequired: drmRequired,
                   castDrmStreamType: castDrmStreamType,
                   isPreview: isPreview,
                   pin: pin,
                   success: success,
                   protected: protected,
                   failure: failure)
    }
    
    func avodStream(vodToken: VodToken,
                    drmRequired: Bool = true,
                    castDrmStreamType: StreamType = .dashWidevine,
                    isPreview: Bool = false,
                    pin: String? = nil,
                    success: @escaping (Stream) -> Void,
                    protected: @escaping (YouthProtected) -> Void,
                    failure: @escaping (Error) -> Void) {
        
        avodStream(vodToken: vodToken,
                   drmRequired: drmRequired,
                   castDrmStreamType: castDrmStreamType,
                   isPreview: isPreview,
                   pin: pin,
                   success: success,
                   protected: protected,
                   failure: failure)
    }
}
