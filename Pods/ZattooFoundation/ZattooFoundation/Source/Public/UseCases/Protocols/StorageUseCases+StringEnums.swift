//
//  StorageUseCases+StringEnum.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 3/27/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


public extension StorageUseCases {

    func save<T: RawRepresentable>(value: Any,
                                   forKey key: T,
                                   success: @escaping () -> Void,
                                   failure: @escaping (Error) -> Void) where T.RawValue == String {
        save(value: value, forKey: key.rawValue, success: success, failure: failure)
    }

    func value<T: RawRepresentable>(forKey key: T,
                                    success: @escaping (Any?) -> Void,
                                    failure: @escaping (Error) -> Void) where T.RawValue == String {
        return value(forKey: key.rawValue, success: success, failure: failure)
    }

    func remove<T: RawRepresentable>(key: T) where T.RawValue == String {
        return remove(key: key.rawValue)
    }
}
