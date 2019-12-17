//
//  DisplayAdEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.04.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension DisplayAdEntity {

    init?(json: JSON) {
        guard let unitPath = json["adUnitPath"].string else { return nil }

        self.unitPath = unitPath
        self.targets = json["targeting"].dictionaryObject ?? [:]

        let sizes = json["size"].arrayObject

        if let sizesAsIntegers = sizes?.compactMap({ $0 as? Int }),
            let sizeTuple = toSizeTuple(sizes: sizesAsIntegers) {
            self.sizes = [sizeTuple]
        }
        else if let sizesAsTuples = sizes?.compactMap({ $0 as? [Int] }) {
            self.sizes = sizesAsTuples.compactMap({ toSizeTuple(sizes: $0) })
        }
        else {
            self.sizes = []
        }
    }
}

// MARK: - Private

private func toSizeTuple(sizes: [Int]) -> AdSize? {
    guard sizes.count == 2 else { return nil }
    return (sizes[0], sizes[1])
}
