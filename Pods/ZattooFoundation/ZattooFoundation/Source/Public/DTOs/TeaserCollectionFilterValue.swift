//
//  TeaserCollectionFilterValue.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/12/18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class TeaserCollectionFilterValue: NSObject {

    public let label: String
    public let value: String

    init(label: String, value: String) {
        self.label = label
        self.value = value
    }
}
