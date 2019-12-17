//
//  DisplayAd.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.04.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation

public typealias AdSize = (Int, Int)

public struct DisplayAd: Equatable {

    public var unitPath: String
    public let sizes: [AdSize]
    public let targets: [String: Any]

    init(unitPath: String,
         sizes: [AdSize],
         targets: [String: Any]) {

        self.unitPath = unitPath
        self.sizes = sizes
        self.targets = targets
    }

    public static func == (lhs: DisplayAd, rhs: DisplayAd) -> Bool {
        return lhs.unitPath == rhs.unitPath && lhs.sizes == rhs.sizes
    }
}
