//
//  LocalDataSource.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 9/27/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol LocalDataSource {

    associatedtype Entity where Entity: Codable
    func get() -> Entity?
    func save(_ entity: Entity)
    func clear()
}
