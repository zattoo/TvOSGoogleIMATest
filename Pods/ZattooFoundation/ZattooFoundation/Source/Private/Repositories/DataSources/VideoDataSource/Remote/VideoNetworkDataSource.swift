//
//  VideoNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/14/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol VideoNetworkDataSource {
    
    func liveStream(channel: ChannelId,
                    qualityLevel: QualityLevelEntity?,
                    drmRequired: Bool,
                    castDrmStreamType: StreamType,
                    isPreview: Bool,
                    pin: String?,
                    success: @escaping (StreamEntity) -> Void,
                    failure: @escaping (WatchNetworkEntityError) -> Void)
    
    func registerTimeshift(channel: ChannelId,
                           success: @escaping (RegisterTimeshiftEntity) -> Void,
                           failure: @escaping (NetworkEntityError) -> Void)
    
    func timeshiftStream(channel: ChannelId,
                         qualityLevel: QualityLevelEntity?,
                         resumeTime: Date,
                         drmRequired: Bool,
                         castDrmStreamType: StreamType,
                         isPreview: Bool,
                         pin: String?,
                         success: @escaping (StreamEntity) -> Void,
                         failure: @escaping (WatchNetworkEntityError) -> Void)
    
    func recallStream(channel: ChannelId,
                      qualityLevel: QualityLevelEntity?,
                      program: ProgramId,
                      drmRequired: Bool,
                      castDrmStreamType: StreamType,
                      isPreview: Bool,
                      pin: String?,
                      success: @escaping (StreamEntity) -> Void,
                      failure: @escaping (WatchNetworkEntityError) -> Void)
    
    func selectiveRecallStream(channel: ChannelId,
                               qualityLevel: QualityLevelEntity?,
                               program: ProgramId,
                               drmRequired: Bool,
                               castDrmStreamType: StreamType,
                               isPreview: Bool,
                               pin: String?,
                               success: @escaping (StreamEntity) -> Void,
                               failure: @escaping (WatchNetworkEntityError) -> Void)
    
    func recordingStream(recording: RecordingId,
                         qualityLevel: QualityLevelEntity?,
                         drmRequired: Bool,
                         castDrmStreamType: StreamType,
                         isPreview: Bool,
                         pin: String?,
                         success: @escaping (StreamEntity) -> Void,
                         failure: @escaping (WatchNetworkEntityError) -> Void)
    
    func tvodStream(vodToken: VodToken,
                    drmRequired: Bool,
                    castDrmStreamType: StreamType,
                    isPreview: Bool,
                    pin: String?,
                    provider: String,
                    success: @escaping (StreamEntity) -> Void,
                    failure: @escaping (WatchNetworkEntityError) -> Void)
    
    func avodStream(vodToken: VodToken,
                    drmRequired: Bool,
                    castDrmStreamType: StreamType,
                    isPreview: Bool,
                    pin: String?,
                    success: @escaping (StreamEntity) -> Void,
                    failure: @escaping (WatchNetworkEntityError) -> Void)

    func vodVideoStream(id: TeasableId,
                        teasableType: TeasableTypeEntity,
                        termToken: String,
                        drmRequired: Bool,
                        qualityLevel: QualityLevelEntity?,
                        castDrmStreamType: StreamType,
                        isPreview: Bool,
                        pin: String?,
                        success: @escaping (StreamEntity) -> Void,
                        failure: @escaping (WatchNetworkEntityError) -> Void)

    func vodTrailerStream(id: TeasableId,
                          teasableType: TeasableTypeEntity,
                          castDrmStreamType: StreamType,
                          isPreview: Bool,
                          pin: String?,
                          success: @escaping (StreamEntity) -> Void,
                          failure: @escaping (WatchNetworkEntityError) -> Void)
    
    func stopStream(with stopUrl: URL)
    
    func track(_ urls: [URL])

    func trickPlay(fromStream stream: URL,
                   success: @escaping (URL) -> Void,
                   failure: @escaping (NetworkEntityError) -> Void)
}
