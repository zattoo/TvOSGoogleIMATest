//
//  Language+Helpers.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/10/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension Sequence where Element == Language {

    func find(languageCode code: String) -> String? {
        let lowercasedCode = code.lowercased()
        return first { $0.code.lowercased() == lowercasedCode }?.code.lowercased()
    }
}
