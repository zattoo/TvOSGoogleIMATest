//
//  TeaserCollectionFilterQuery+Helpers.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/12/18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


public extension Dictionary where Key == String, Value == [String] {

    var filterQueryCount: Int {
        return reduce(0) { $0 + $1.value.count }
    }

    func contains(filterId id: String, value: String) -> Bool {
        return self[id]?.contains(value) ?? false
    }

    mutating func append(filterId id: String, value: String) {
        if self[id] == nil {
            self[id] = []
        }
        self[id]?.append(value)
    }

    mutating func remove(filterId id: String, value: String) {
        guard let index = self[id]?.index(of: value) else { return }
        self[id]?.remove(at: index)

        if self[id]?.isEmpty ?? false {
            self[id] = nil
        }
    }
}
