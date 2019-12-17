//
//  TimeInterval+Helper.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 3/7/18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


public extension TimeInterval {

    static var randomTimeIntervalToAvoidDDOSAttack: TimeInterval {
        return TimeInterval(arc4random_uniform(60))
    }

    var roundedDownToNearestMinute: TimeInterval {
        return floor(self / 60) * 60
    }

    var dateSinceNow: Date {
        return Date(timeIntervalSinceNow: self)
    }

    var dateSince1970: Date {
        return Date(timeIntervalSince1970: self)
    }

    func date(since date: Date) -> Date {
        return Date(timeInterval: self, since: date)
    }
}
