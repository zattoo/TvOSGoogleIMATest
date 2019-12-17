//
//  Brand.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 11/6/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


@objcMembers
final public class Brand: NSObject {
    public let id: String
    public let title: String
    public let logoToken: String?

    init(id: String, title: String, logoToken: String?) {
        self.id = id
        self.title = title
        self.logoToken = logoToken
    }
}
