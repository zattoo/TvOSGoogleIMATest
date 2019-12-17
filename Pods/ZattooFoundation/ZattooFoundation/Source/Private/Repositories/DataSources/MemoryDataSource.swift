//
//  MemoryDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero on 01.02.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol MemoryDataSource {

    associatedtype Entity
    func get() -> Entity?
    func save(_ entity: Entity)
    func clear()
}
