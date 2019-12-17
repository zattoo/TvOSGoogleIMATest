//
//  Serializable.swift
//  ZattooFoundation
//
//  Created by David Cordero on 03.10.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


public protocol Serializable: Codable {
    func serialize() -> Data?
    func toJSONString() -> String?
}

public extension Serializable {
    func serialize() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
    
    func toJSONString() -> String? {
        guard let data = serialize() else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
