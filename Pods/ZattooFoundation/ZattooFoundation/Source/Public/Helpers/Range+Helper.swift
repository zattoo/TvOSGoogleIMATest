//
//  Range+Helper.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/17/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


public extension Comparable {
    
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}
