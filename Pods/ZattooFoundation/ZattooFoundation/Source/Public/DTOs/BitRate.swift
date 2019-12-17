//
//  BitRate.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/23/18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


public struct BitRate {

    public static let noLimit = BitRate(kbps: 0)

    public let kbps: Double

    public var bps: Double {
        return kbps * 1000
    }

    public init(kbps: Double) {
        self.kbps = kbps
    }
}
