//
//  GenericLocalDataSource.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 9/27/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


class GenericLocalDataSource<Entity: Codable>: LocalDataSource {

    init(archiveKey: String,
         userDefaults: UserDefaults = ZattooConfiguration.shared.groupUserDefaults) {
        self.archiveKey = archiveKey
        self.userDefaults = userDefaults
    }

    // MARK: - ChannelListLocalDataSource

    func get() -> Entity? {
        queue.sync {
            guard let data = self.userDefaults.value(forKey: self.archiveKey) as? Data else {
                return nil
            }

            if let entity = try? PropertyListDecoder().decode(Entity.self, from: data) {
                return entity
            }
            else {
                self.clear()
                return nil
            }
        }
    }

    func save(_ entity: Entity) {
        queue.async(flags: .barrier) {
            guard let data = try? PropertyListEncoder().encode(entity) else { return }
            self.userDefaults.set(data, forKey: self.archiveKey)
        }
    }

    func clear() {
        queue.async(flags: .barrier) {
            self.userDefaults.set(nil, forKey: self.archiveKey)
        }
    }

    // MARK: - Private
    private let userDefaults: UserDefaults
    private (set) var archiveKey: String

    private lazy var queue: DispatchQueue = {
        return DispatchQueue(label: "\(String(describing: self)).queue", attributes: .concurrent)
    }()
}
