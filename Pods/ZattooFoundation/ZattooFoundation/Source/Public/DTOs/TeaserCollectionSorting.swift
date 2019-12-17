//
//  TeaserCollectionSorting.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 27.09.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation

@objc(ZattooFoundationTeaserCollectionSorting)
final public class TeaserCollectionSorting: NSObject {

    public let name: String
    public let value: String

    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}
