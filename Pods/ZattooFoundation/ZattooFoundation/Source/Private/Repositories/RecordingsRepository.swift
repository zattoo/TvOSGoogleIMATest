//
//  RecordingsRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero on 18/08/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol RecordingsRepository {

    func refresh(success: @escaping (ListOfRecordingsModel) -> Void,
                 failure: @escaping (ErrorModel) -> Void)

    func fetch(success: @escaping (ListOfRecordingsModel) -> Void,
               failure: @escaping (ErrorModel) -> Void)

    func record(program: ProgramId,
                success: @escaping (RecordingModel) -> Void,
                followUp: @escaping (ListOfRecordingsModel) -> Void,
                failure: @escaping (ErrorModel) -> Void)

    func remove(recording: RecordingId,
                success: @escaping () -> Void,
                followUp: @escaping (ListOfRecordingsModel) -> Void,
                failure: @escaping (ErrorModel) -> Void)

    func remove(recordings: [RecordingId],
                success: @escaping () -> Void,
                followUp: @escaping (ListOfRecordingsModel) -> Void,
                failure: @escaping (ErrorModel) -> Void)

    func remove(teaserCollectionId: String,
                success: @escaping () -> Void,
                followUp: @escaping (ListOfRecordingsModel) -> Void,
                failure: @escaping (ErrorModel) -> Void)

    func undelete(recording: RecordingId,
                  success: @escaping (RecordingModel) -> Void,
                  followUp: @escaping (ListOfRecordingsModel) -> Void,
                  failure: @escaping (ErrorModel) -> Void)

    func update(recording: RecordingId,
                lastPosition: Date,
                success: @escaping (RecordingModel) -> Void,
                followUp: @escaping (ListOfRecordingsModel) -> Void,
                failure: @escaping (ErrorModel) -> Void)

    func schedule(program: ProgramId,
                  success: @escaping (RecordingModel, SeriesModel) -> Void,
                  followUp: @escaping (ListOfRecordingsModel) -> Void,
                  warning: @escaping (Int) -> Void,
                  failure: @escaping (ErrorModel) -> Void)

    func forceSchedule(program: ProgramId,
                       success: @escaping (RecordingModel, SeriesModel) -> Void,
                       followUp: @escaping (ListOfRecordingsModel) -> Void,
                       failure: @escaping (ErrorModel) -> Void)

    func schedule(series: SeriesId,
                  channel: ChannelId?,
                  success: @escaping (RecordingModel, SeriesModel) -> Void,
                  followUp: @escaping (ListOfRecordingsModel) -> Void,
                  warning: @escaping (Int) -> Void,
                  failure: @escaping (ErrorModel) -> Void)

    func forceSchedule(series: SeriesId,
                       channel: ChannelId?,
                       success: @escaping (RecordingModel, SeriesModel) -> Void,
                       followUp: @escaping (ListOfRecordingsModel) -> Void,
                       failure: @escaping (ErrorModel) -> Void)

    func unschedule(series: SeriesId,
                    channel: ChannelId?,
                    success: @escaping (StoppedSeriesModel) -> Void,
                    followUp: @escaping (ListOfRecordingsModel) -> Void,
                    failure: @escaping (ErrorModel) -> Void)
    
    func removeAll()
}
