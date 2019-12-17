//
//  ListOfRecordings+Helpers.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/12/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension ListOfRecordings {

    public func hasRecording(for program: Program) -> Bool {
        return recordingsDictionary[program] != nil
    }

    public func recording(for program: Program) -> Recording? {
        return recordingsDictionary[program]
    }

    public func hasAtLeastOneRecording(for seriesTeaser: SeriesTeaser) -> Bool {
        return recordedSeriesCounter[seriesTeaser] != nil
    }

    public func numberOfRecordings(for seriesTeaser: SeriesTeaser) -> Int {
        return recordedSeriesCounter[seriesTeaser] ?? 0
    }

    public func isRecordingSeries(_ seriesTeaser: SeriesTeaser) -> Bool {
        return recordedTvSeriesIds.contains(seriesTeaser)
    }
}

extension Optional where Wrapped == ListOfRecordings {

    public func hasRecording(for program: Program) -> Bool {
        return self?.hasRecording(for: program) ?? false
    }

    public func recording(for program: Program) -> Recording? {
        return self?.recording(for: program)
    }

    public func hasAtLeastOneRecording(for seriesTeaser: SeriesTeaser) -> Bool {
        return self?.hasAtLeastOneRecording(for: seriesTeaser) ?? false
    }

    public func numberOfRecordings(for seriesTeaser: SeriesTeaser) -> Int {
        return self?.numberOfRecordings(for: seriesTeaser) ?? 0
    }

    public func isRecordingSeries(_ seriesTeaser: SeriesTeaser) -> Bool {
        return self?.isRecordingSeries(seriesTeaser) ?? false
    }
}

extension Dictionary where Key == ProgramId {

    public subscript(_ program: Program) -> Value? {
        guard let programId = program.id else { return nil }
        return self[programId]
    }
}

extension Dictionary where Key == SeriesId {

    public subscript(_ seriesTeaser: SeriesTeaser) -> Value? {
        return self[seriesTeaser.tvSeriesId]
    }
}

extension Set where Element == SeriesId {

    public func contains(_ seriesTeaser: SeriesTeaser) -> Bool {
        return contains(seriesTeaser.tvSeriesId)
    }
}

extension Dictionary where Key == SeriesId, Value == Int {

    mutating func increment(_ recording: Recording) {
        guard let seriesId = recording.tvSeriesId else { return }
        if let count = self[seriesId] {
            self[seriesId] = count + 1
        }
        else {
            self[seriesId] = 1
        }
    }
}
