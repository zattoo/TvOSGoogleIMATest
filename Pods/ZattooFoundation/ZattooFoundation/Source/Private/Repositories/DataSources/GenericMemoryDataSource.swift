//
//  GenericMemoryDataSource.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/26/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


private let defaultExpirationTime = 5.minutes.timeInterval

class GenericMemoryDataSource<Entity>: MemoryDataSource {

    init(expirationTime: TimeInterval = defaultExpirationTime) {
        self.expirationTime = expirationTime
    }

    func get() -> Entity? {
        return queue.sync {
            guard let age = age, age < expirationTime else { return nil }
            return entity
        }
    }

    func save(_ entity: Entity) {
        queue.async(flags: .barrier) {
            self.entity = entity
            self.savedAt = Date()
        }
    }

    func clear() {
        queue.async(flags: .barrier) {
            self.entity = nil
            self.savedAt = nil
        }
    }

    // MARK: - Private

    private var savedAt: Date?
    private var entity: Entity?
    private (set) var expirationTime: TimeInterval

    private lazy var queue: DispatchQueue = {
        return DispatchQueue(label: "\(String(describing: self)).queue", attributes: .concurrent)
    }()

    private var age: TimeInterval? {
        guard let savedAt = savedAt else { return nil }
        return Date().timeIntervalSince(savedAt)
    }
}
