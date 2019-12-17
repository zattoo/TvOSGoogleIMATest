//
//  SettingsRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero on 28/09/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol SettingsRepository {
    
    func save(value: Any,
              forKey key: String,
              success: @escaping () -> Void,
              failure: @escaping (ErrorModel) -> Void)
    
    func value(forKey key: String,
               success: @escaping (Any?) -> Void,
               failure: @escaping (ErrorModel) -> Void)

    func remove(key: String)

    func removeAll()
}
