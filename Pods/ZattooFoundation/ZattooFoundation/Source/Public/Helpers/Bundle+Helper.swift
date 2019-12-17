//
//  Bundle+Helper.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 5/19/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc
public protocol InfoDictionary {
    
    var infoDictionary: [String: Any]? { get }
}

public extension InfoDictionary {
    
    func value<T>(forKey key: String) -> T? {
        return infoDictionary?[key] as? T
    }
}

extension Bundle: InfoDictionary { }
