//
//  TemporalEvents.swift
//  ZattooFoundation
//
//  Created by Abraham Tomás Díaz Abreu on 25/07/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


public protocol TemporalEvent {
    var start: Date { get }
    var end: Date { get }
}

public extension TemporalEvent {
    
    var isLive: Bool {
        let now = Date()
        return now >= start && end > now
    }
    
    var isFuture: Bool {
        return start > Date()
    }
    
    var isEnded: Bool {
        return end <= Date()
    }
    
    var duration: TimeInterval {
        guard start < end else {
            return 0
        }
        
        return end.timeIntervalSince1970 - start.timeIntervalSince1970
    }
    
    var progress: Float {
        guard duration >= 0 else {
            return 0
        }
        
        switch Date() {
        case let now where start > now:
            return 0
        case let now where end < now:
            return 1
        default:
            return Float(abs(start.timeIntervalSinceNow) / duration)
        }
    }
}

extension Recording: TemporalEvent { }
extension Program: TemporalEvent { }
