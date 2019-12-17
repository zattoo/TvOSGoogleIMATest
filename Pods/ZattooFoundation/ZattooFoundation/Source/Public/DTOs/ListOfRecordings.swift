//
//  ListOfRecordings.swift
//  ZattooFoundation
//
//  Created by David Cordero on 28.06.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


public typealias RecordingsDictionary = [ProgramId: Recording]
public typealias RecordedSeriesCounter = [SeriesId: Int]

@objc
final public class ListOfRecordings: NSObject {
    public let recordings: [Recording]
    public let recordedTvSeries: [SeriesSummary]

    init(recordings: [Recording], recordedTvSeries: [SeriesSummary]) {
        self.recordings = recordings
        self.recordedTvSeries = recordedTvSeries
    }

    // MARK: - Transformation

    public var recordingsDictionary: RecordingsDictionary {
        return transformations.recordingsDictionary
    }

    public var recordedSeriesCounter: RecordedSeriesCounter {
        return transformations.recordedSeriesCounter
    }

    public lazy var recordedTvSeriesIds: Set<SeriesId> = {
        return Set(recordedTvSeries.map { $0.seriesId })
    }()

    // MARK: - Private

    private lazy var transformations: (recordingsDictionary: RecordingsDictionary, recordedSeriesCounter: RecordedSeriesCounter) = {
        var recordingsDictionary = RecordingsDictionary()
        var recordedSeriesCounter = RecordedSeriesCounter()

        for recording in recordings {
            recordingsDictionary[recording.programId] = recording
            recordedSeriesCounter.increment(recording)
        }

        return (recordingsDictionary, recordedSeriesCounter)
    }()
}
