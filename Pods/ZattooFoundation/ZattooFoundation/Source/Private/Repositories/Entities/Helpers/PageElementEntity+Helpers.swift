//
//  PageElementEntity+Helpers.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/31/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


private let teasersPerPage = 10

extension PageElementEntity {

    var perPage: Int {
        content.style == .marquee ? content.perPage : teasersPerPage
    }
}
