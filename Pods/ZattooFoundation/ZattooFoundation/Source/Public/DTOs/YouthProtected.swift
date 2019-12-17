//
//  YouthProtected.swift
//  ZattooFoundation
//
//  Created by Abraham Tomas Diaz Abreu on 08.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation

@objc public enum YouthProtectedState: Int {
    case missingPin
    case invalidPin
    case pinLocked
}

@objc(ZattooFoundationYouthProtected)
final public class YouthProtected: NSObject {
    
    public let attemptsLeft: Int?
    public let pinRequiredUntil: Date?
    public let state: YouthProtectedState
    public let lockedUntil: Date?
    
    init(state: YouthProtectedState, attemptsLeft: Int? = nil, pinRequiredUntil: Date? = nil, lockedUntil: Date? = nil) {
        self.state = state
        self.attemptsLeft = attemptsLeft
        self.pinRequiredUntil = pinRequiredUntil
        self.lockedUntil = lockedUntil
    }
}
