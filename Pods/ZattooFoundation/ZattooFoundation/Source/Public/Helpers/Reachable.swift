//
//  Reachable.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 7/12/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import Reachability


@objc public protocol Reachable {
    
    var isNotReachable: Bool { get }
    var isReachableViaWiFi: Bool { get }
}

extension Reachability: Reachable {
    
    public var isNotReachable: Bool {
        return connection == .none
    }
    
    public var isReachableViaWiFi: Bool {
        return connection == .wifi
    }
}
