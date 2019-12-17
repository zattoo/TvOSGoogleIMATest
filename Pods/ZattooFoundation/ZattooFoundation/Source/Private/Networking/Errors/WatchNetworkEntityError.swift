//
//  WatchNetworkEntityError.swift
//  ZattooFoundation
//
//  Created by David Cordero on 24.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


final class WatchNetworkEntityError: NetworkEntityError {
    
    let attemptsLeft: Int?
    let pinRequiredUntil: Date?
    let lockedUntil: Date?
    
    var isPinProtected: Bool {
        return [NetworkEntityErrorCode.missingPin, NetworkEntityErrorCode.invalidPin, NetworkEntityErrorCode.pinLocked].contains(code)
    }
    
    required init(code: NetworkEntityErrorCode, localizedDescriptions: [String: String]?) {
        self.attemptsLeft = nil
        self.pinRequiredUntil = nil
        self.lockedUntil = nil
        super.init(code: code, localizedDescriptions: localizedDescriptions)
    }

    required init(json: JSON) {
        attemptsLeft = json["attempts_left"].int
        pinRequiredUntil = json["youth_protection_pin_required_until"].date
        lockedUntil = json["locked_until"].date
        super.init(json: json)
    }
}
