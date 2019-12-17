//
//  ScheduledWeakTimer.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 8/15/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class ScheduledWeakTimer {
    private var timer: Timer?
    private let callback: () -> Void
    
    public init(timeInterval: TimeInterval, userInfo: AnyObject? = nil, repeats: Bool, callback: @escaping () -> Void) {
        self.callback = callback
        self.timer = .scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(invokeCallback), userInfo: userInfo, repeats: repeats)
    }
    
    public func invalidate() {
        timer?.invalidate()
    }
    
    // MARK: - Private
    
    @objc private func invokeCallback() {
        callback()
    }
}
