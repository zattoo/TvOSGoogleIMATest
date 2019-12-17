//
//  TeaserCollectionFilter.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 21.09.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc(ZattooFoundationTeaserCollectionFilter)
final public class TeaserCollectionFilter: NSObject {

    public let id: String
    public let name: String
    public let values: [TeaserCollectionFilterValue]

    init(id: String, name: String, values: [TeaserCollectionFilterValue]) {
        self.id = id
        self.name = name
        self.values = values
    }
}
