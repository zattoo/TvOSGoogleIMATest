//
//  Tuples+Helper.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 11/4/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


public func ==<A: Equatable, B: Equatable>(lhs: [(A, B)], rhs: [(A, B)]) -> Bool {
    guard lhs.count == rhs.count else { return false }
    for (index, lhsElement) in lhs.enumerated() {
        guard lhsElement == rhs[index] else {
            return false
        }
    }
    return true
}
