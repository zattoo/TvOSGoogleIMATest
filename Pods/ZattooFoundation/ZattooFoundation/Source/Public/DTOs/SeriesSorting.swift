//
//  SeriesSorting.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 18.10.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc(ZattooFoundationSeriesSorting)
final public class SeriesSorting: NSObject {

    public let name: String
    public let value: String

    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}
