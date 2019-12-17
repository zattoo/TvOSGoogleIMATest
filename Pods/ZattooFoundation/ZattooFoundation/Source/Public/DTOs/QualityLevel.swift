//
//  QualityLevel.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/1/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


public enum QualityLevel: String {
    case sd
    case hd
    case uhd
}

extension QualityLevel: Equatable {

    static public func == (lhs: QualityLevel, rhs: QualityLevel) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

extension QualityLevel: Comparable {
    public static func < (lhs: QualityLevel, rhs: QualityLevel) -> Bool {
        switch lhs {
        case .sd:
            return rhs == .hd || rhs == .uhd
        case .hd:
            return rhs == .uhd
        case .uhd:
            return false
        }
    }
}
