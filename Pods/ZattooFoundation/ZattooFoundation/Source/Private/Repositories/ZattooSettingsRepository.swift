//
//  ZattooSettingsRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero on 28/09/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ZattooSettingsRepository: SettingsRepository {
    private let localDataSource: SettingsLocalDataSource
    
    // MARK: - Initializers

    init(localDataSource: SettingsLocalDataSource = ZattooSettingsUserDefaultsDataSource()) {
        self.localDataSource = localDataSource
    }
    
    // MARK: - SettingsRepository
    
    func save(value: Any,
              forKey key: String,
              success: @escaping () -> Void,
              failure: @escaping (ErrorModel) -> Void) {
        
        localDataSource.set(value: value, forKey: key, success: success)
    }
    
    func value(forKey key: String,
               success: @escaping (Any?) -> Void,
               failure: @escaping (ErrorModel) -> Void) {
        
        localDataSource.value(forKey: key, success: success)
    }

    func remove(key: String) {
        localDataSource.remove(key: key)
    }
    
    func removeAll() {
        localDataSource.removeAll()
    }
}
