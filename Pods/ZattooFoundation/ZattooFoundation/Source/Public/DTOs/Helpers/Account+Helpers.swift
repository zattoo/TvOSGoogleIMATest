//
//  Account+Helpers.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/4/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftDate


public extension Account {
    
    var restrictedUsageTimeTillReset: TimeInterval? {
        let now = Date()
        guard let restrictedUsageResetDate = restrictedUsageResetDate, restrictedUsageResetDate > now else { return nil }
        return restrictedUsageResetDate.timeIntervalSince(now)
    }

    var daysSinceRegistration: Int? {
        guard let registeredDate = dateRegistered else { return nil }
        return TimePeriod(start: registeredDate.inDefaultRegion(), end: DateInRegion()).durationIn(.day)
    }
}
