//
//  VodSearchResultEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero on 01.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodSearchResultEntity {
    let total: Int
    let totalPages: Int
    let page: Int
    let perPage: Int
    let vods: [Any]
}
