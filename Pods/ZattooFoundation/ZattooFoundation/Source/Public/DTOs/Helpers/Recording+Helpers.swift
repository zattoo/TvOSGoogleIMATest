//
//  Recording+Helpers.swift
//  ZattooFoundation
//
//  Created by David Cordero on 08/09/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftDate


public enum RecordingsStatus {
    case scheduled
    case inProgress
    case partial
    case recorded
    case seriesScheduled
    case seriesInProgress
    case seriesPartial
    case seriesRecorded
}

public extension Recording {
    
    var isRecorded: Bool {
        return Date() >= end
    }
    
    var seenProgress: Float {
        guard duration >= 0 else {
            return 0
        }
        
        switch start.addingTimeInterval(lastPosition) {
        case let lastSeenDate where lastSeenDate < start:
            return 0
        case let lastSeenDate where lastSeenDate > end:
            return 1
        default:
            return Float(lastPosition / duration)
        }
    }
    
    var status: RecordingsStatus {
        
        if start.isInFuture {
            return isRecordedAsSeries ? .seriesScheduled : .scheduled
        }
        else if start.isInPast && end.isInFuture {
            return isRecordedAsSeries ? .seriesInProgress : .inProgress
        }
        else if isPartial {
            return isRecordedAsSeries ? .seriesPartial : .partial
        }
        else {
            return isRecordedAsSeries ? .seriesRecorded : .recorded
        }
    }
    
    var aboutToExpire: Bool {
        var willExpireSoon = false
        let now = Date()
        if let expiration = expiration, let daysTillExpiration = (expiration - now).in(.day) {
            willExpireSoon = daysTillExpiration > 0 && daysTillExpiration < 7
        }
        return willExpireSoon
    }
    
    static func minutesTillExpiration(expiration: Date?) -> Int {
        guard let expiration = expiration else { return 0 }
        let now = Date()
        guard let daysTillExpiration = (expiration - now).in(.minute) else { return 0 }
        return max(0, daysTillExpiration)
    }
}

public extension Sequence where Iterator.Element == Recording {
    
    var duration: TimeInterval {
        return reduce(0) { $0 + $1.duration.roundedDownToNearestMinute }
    }
}

// MARK: - Filters

public enum RecordingsFilter {
    case recorded
    case recordedAfter(date: Date)
    case scheduled
    case aboutToExpire
}

public extension Sequence where Iterator.Element == Recording {
    
    func filter(by type: RecordingsFilter) -> [Recording] {
        switch type {
        case .recorded:
            return filter { $0.isRecorded }
        case .recordedAfter(let date):
            return filter { Date() >= $0.end && date <= $0.start }
        case .scheduled:
            return filter { !$0.isRecorded }
        case .aboutToExpire:
            return filter { $0.aboutToExpire }.sortByExpiration()
        }
    }
}

// MARK: - Sorting

public extension Sequence where Iterator.Element == Recording {
    
    func sortByStart(_ isOrderedBefore: (Date, Date) -> Bool) -> [Recording] {
        return sorted { isOrderedBefore($0.start, $1.start) }
    }
    
    func sortByTitle(_ isOrderedBefore: (String, String) -> Bool) -> [Recording] {
        return sorted { isOrderedBefore($0.title, $1.title) }
    }
    
    func sortByExpiration() -> [Recording] {
        return sorted {
            if let expiration1 = $0.expiration, let expiration2 = $1.expiration {
                return expiration1 < expiration2
            }
            return false
        }
    }
}
