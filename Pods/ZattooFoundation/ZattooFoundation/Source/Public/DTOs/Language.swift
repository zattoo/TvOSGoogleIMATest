//
//  Language.swift
//  ZattooFoundation
//
//  Created by David Cordero on 04.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


@objcMembers
final public class Language: NSObject {
    public let code: String
    public let name: String
    
    init(code: String, name: String) {
        self.code = code
        self.name = name
    }
}
