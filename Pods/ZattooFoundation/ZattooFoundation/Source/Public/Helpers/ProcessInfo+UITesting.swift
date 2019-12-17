//
//  ProcessInfo+UITesting.swift
//  Zattoo
//
//  Created by Philipp Frischmuth on 22.03.18.
//  Copyright © 2018 Zattoo. All rights reserved.
//

import Foundation


public extension ProcessInfo {

    @objc
    var isUITesting: Bool {
        return arguments.contains("isUITesting")
    }

    @objc
    var postmanKey: String? {
        return environment["PostmanKey"]
    }
}
