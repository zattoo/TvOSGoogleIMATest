//
//  StorageUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero on 09.11.16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc public protocol StorageUseCases {
    
    @objc
    func save(value: Any,
              forKey key: String,
              success: @escaping () -> Void,
              failure: @escaping (Error) -> Void)
    
    @objc
    func value(forKey key: String,
               success: @escaping (Any?) -> Void,
               failure: @escaping (Error) -> Void)

    @objc
    func remove(key: String)
}
