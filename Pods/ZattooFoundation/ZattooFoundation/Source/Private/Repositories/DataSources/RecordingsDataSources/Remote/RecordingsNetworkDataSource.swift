//
//  RecordingsNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero on 18/08/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol RecordingsNetworkDataSource {
    
    func fetch(success: @escaping (ListOfRecordingsEntity) -> Void,
               failure: @escaping (NetworkEntityError) -> Void)
    
    func record(program: ProgramId,
                success: @escaping (RecordingEntity) -> Void,
                failure: @escaping (NetworkEntityError) -> Void)
    
    func remove(recording: RecordingId,
                success: @escaping () -> Void,
                failure: @escaping (NetworkEntityError) -> Void)

    func remove(recordings: [RecordingId],
                success: @escaping () -> Void,
                failure: @escaping (NetworkEntityError) -> Void)

    func remove(teaserCollectionId: String,
                success: @escaping () -> Void,
                failure: @escaping (NetworkEntityError) -> Void)    
    
    func undelete(recording: RecordingId,
                  success: @escaping (RecordingEntity) -> Void,
                  failure: @escaping (NetworkEntityError) -> Void)
    
    func update(recording: RecordingId,
                lastPosition: Date,
                success: @escaping (RecordingEntity) -> Void,
                failure: @escaping (NetworkEntityError) -> Void)
    
    func schedule(program: ProgramId,
                  success: @escaping (RecordingEntity, SeriesEntity) -> Void,
                  failure: @escaping (RecordingNetworkEntityError) -> Void)
    
    func forceSchedule(program: ProgramId,
                       success: @escaping (RecordingEntity, SeriesEntity) -> Void,
                       failure: @escaping (NetworkEntityError) -> Void)
    
    func schedule(series: SeriesId,
                  channel: ChannelId?,
                  success: @escaping (RecordingEntity, SeriesEntity) -> Void,
                  failure: @escaping (RecordingNetworkEntityError) -> Void)
    
    func forceSchedule(series: SeriesId,
                       channel: ChannelId?,
                       success: @escaping (RecordingEntity, SeriesEntity) -> Void,
                       failure: @escaping (RecordingNetworkEntityError) -> Void)
    
    func unschedule(series: SeriesId,
                    channel: ChannelId?,
                    success: @escaping (StoppedSeriesEntity) -> Void,
                    failure: @escaping (NetworkEntityError) -> Void)
}
