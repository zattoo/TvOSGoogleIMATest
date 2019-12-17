//
//  SettingsLocalDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero on 28/09/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol SettingsLocalDataSource {
    
    func value(forKey key: String, success: @escaping (Any?) -> Void)
    func set(value: Any, forKey key: String, success: @escaping () -> Void)
    func remove(key: String)
    func removeAll()
}
