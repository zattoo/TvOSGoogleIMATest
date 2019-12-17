//
//  VodStatus+Helpers.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 3/5/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodStatus {

    // MARK: - Internal

    internal var isExpired: Bool {
        if let orderedUntil = orderedUntil {
            return orderedUntil <= Date()
        }
        return isOrderExpired
    }

    internal var orderedState: VodStatusOrderedState? {
        guard isOrdered else { return nil }

        let orderedState: VodStatusOrderedState
        if isExpired {
            orderedState = .expired
        }
        else if let orderedUntil = orderedUntil, vodType == .tvod {
            orderedState = .rented(orderedUntil: orderedUntil)
        }
        else {
            orderedState = .purchased
        }
        return orderedState
    }

    internal func progress(duration: TimeInterval) -> Float {
        guard duration > 0 else { return 0 }

        func calculateProgress(with duration: TimeInterval) -> Float {
            return max(0, min(Float(lastPosition / duration), 1))
        }
        
        guard let orderedState = orderedState else {
            return calculateProgress(with: duration)
        }

        switch orderedState {
        case .purchased,
             .rented,
             .subscribed:
            return calculateProgress(with: duration)
        case .expired,
             .error,
             .notSubscribed:
            return 0
        }
    }
}
