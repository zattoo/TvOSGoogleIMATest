//
//  ZattooSettingsUserDefaultsDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero on 28/09/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


private let settingsArchiveName = "SettingsUserDefaults"
private let queue = DispatchQueue(label: "\(settingsArchiveName).queue", qos: .userInitiated, attributes: .concurrent)

struct ZattooSettingsUserDefaultsDataSource: SettingsLocalDataSource {

    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = ZattooConfiguration.shared.groupUserDefaults) {
        self.userDefaults = userDefaults
    }
    
    // MARK: - SettingsLocalDataSource
    
    func value(forKey key: String, success: @escaping (Any?) -> Void) {
        queue.async {
            let settings = self.userDefaults.dictionary(forKey: settingsArchiveName)
            GlobalMainQueue.async {
                success(settings?[key])
            }
        }
    }
    
    func set(value: Any, forKey key: String, success: @escaping () -> Void) {
        queue.async(flags: .barrier) {
            var settings = self.userDefaults.dictionary(forKey: settingsArchiveName) ?? [String: Any]()
            settings[key] = value
            self.userDefaults.set(settings, forKey: settingsArchiveName)
            GlobalMainQueue.async {
                success()
            }
        }
    }

    func remove(key: String) {
        queue.async(flags: .barrier) {
            var settings = self.userDefaults.dictionary(forKey: settingsArchiveName) ?? [String: Any]()
            settings[key] = nil
            self.userDefaults.set(settings, forKey: settingsArchiveName)
        }
    }
    
    func removeAll() {
        queue.async(flags: .barrier) {
            self.userDefaults.set(nil, forKey: settingsArchiveName)
        }
    }
}
