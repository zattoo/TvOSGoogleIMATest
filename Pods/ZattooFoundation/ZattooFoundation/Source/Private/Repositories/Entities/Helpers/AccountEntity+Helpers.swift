//
//  AccountEntity+Helpers.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 12/6/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


private let subServiceIdForHiQ = 10

extension AccountEntity {

    var isHiQ: Bool {
        return !services.lazy.filter { $0.subservices.contains(subServiceIdForHiQ) }.isEmpty
    }
}
