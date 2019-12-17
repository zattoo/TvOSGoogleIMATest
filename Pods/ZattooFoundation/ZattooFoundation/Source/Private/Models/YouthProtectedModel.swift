//
//  YouthProtectedModel.swift
//  ZattooFoundation
//
//  Created by Abraham Tomas Diaz Abreu on 08.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


struct YouthProtectedModel {
    
    let state: YouthProtectedState
    let attemptsLeft: Int?
    let pinRequiredUntil: Date?
    let lockedUntil: Date?
    
    init(state: YouthProtectedState, attemptsLeft: Int? = nil, pinRequiredUntil: Date? = nil, lockedUntil: Date? = nil) {
        self.state = state
        self.attemptsLeft = attemptsLeft
        self.pinRequiredUntil = pinRequiredUntil
        self.lockedUntil = lockedUntil
    }
}
