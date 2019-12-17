//
//  RecordingsUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero on 18/08/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc public protocol RecordingsUseCases {
    
    @objc
    func recordings(success: @escaping (ListOfRecordings) -> Void,
                    failure: @escaping (Error) -> Void)

    #if os(iOS)
    @objc
    func refresh(success: @escaping (ListOfRecordings) -> Void,
                 failure: @escaping (Error) -> Void)
    #endif
    
    @objc
    func record(program: ProgramId,
                success: @escaping (Recording) -> Void,
                followUp: @escaping (ListOfRecordings) -> Void,
                failure: @escaping (Error) -> Void)
    
    @objc
    func remove(recording: RecordingId,
                success: @escaping () -> Void,
                followUp: @escaping (ListOfRecordings) -> Void,
                failure: @escaping (Error) -> Void)

    @objc
    func remove(recordings: [RecordingId],
                success: @escaping () -> Void,
                followUp: @escaping (ListOfRecordings) -> Void,
                failure: @escaping (Error) -> Void)

    @objc    
    func remove(teaserCollectionId: String,
                success: @escaping () -> Void,
                followUp: @escaping (ListOfRecordings) -> Void,
                failure: @escaping (Error) -> Void)
    
    @objc
    func undelete(recording: RecordingId,
                  success: @escaping (Recording) -> Void,
                  followUp: @escaping (ListOfRecordings) -> Void,
                  failure: @escaping (Error) -> Void)
    
    @objc
    func update(recording: RecordingId,
                lastPosition: Date,
                success: @escaping (Recording) -> Void,
                followUp: @escaping (ListOfRecordings) -> Void,
                failure: @escaping (Error) -> Void)
    
    @objc
    func schedule(program: ProgramId,
                  success: @escaping (Recording, Series) -> Void,
                  followUp: @escaping (ListOfRecordings) -> Void,
                  warning: @escaping (Int) -> Void,
                  failure: @escaping (Error) -> Void)
    
    @objc
    func forceSchedule(program: ProgramId,
                       success: @escaping (Recording, Series) -> Void,
                       followUp: @escaping (ListOfRecordings) -> Void,
                       failure: @escaping (Error) -> Void)
    
    @objc
    func schedule(series: SeriesId,
                  channel: ChannelId?,
                  success: @escaping (Recording, Series) -> Void,
                  followUp: @escaping (ListOfRecordings) -> Void,
                  warning: @escaping (Int) -> Void,
                  failure: @escaping (Error) -> Void)
    
    @objc
    func forceSchedule(series: SeriesId,
                       channel: ChannelId?,
                       success: @escaping (Recording, Series) -> Void,
                       followUp: @escaping (ListOfRecordings) -> Void,
                       failure: @escaping (Error) -> Void)
    
    @objc
    func unschedule(series: SeriesId,
                    channel: ChannelId?,
                    success: @escaping (StoppedSeries) -> Void,
                    followUp: @escaping (ListOfRecordings) -> Void,
                    failure: @escaping (Error) -> Void)
}
