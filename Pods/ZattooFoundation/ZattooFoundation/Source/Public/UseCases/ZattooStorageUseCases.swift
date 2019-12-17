//
//  ZattooStorageUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero on 09.11.16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class ZattooStorageUseCases: NSObject, StorageUseCases {
    
    private let settingsRepository: SettingsRepository
    
    // MARK: - Initializers
    
    convenience public override init() {
        self.init(settingsRepository: ZattooSettingsRepository())
    }
    
    init(settingsRepository: SettingsRepository) {
        self.settingsRepository = settingsRepository
        super.init()
    }
    
    // MARK: - StorageUseCases
    
    @objc
    public func save(value: Any,
                     forKey key: String,
                     success: @escaping () -> Void,
                     failure: @escaping (Error) -> Void) {
        
        settingsRepository.save(
            value: value,
            forKey: key,
            success: success,
            failure: { failure($0.DTO) })
    }
    
    @objc
    public func value(forKey key: String,
                      success: @escaping (Any?) -> Void,
                      failure: @escaping (Error) -> Void) {
        
        settingsRepository.value(
            forKey: key,
            success: success,
            failure: { failure($0.DTO) })
    }

    @objc
    public func remove(key: String) {
        settingsRepository.remove(key: key)
    }
}
