//
//  VodSearchResult.swift
//  ZattooFoundation
//
//  Created by David Cordero on 01.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


@objcMembers
final public class VodSearchResult: NSObject {
    public let total: Int
    public let totalPages: Int
    public let page: Int
    public let perPage: Int
    public let vods: [Teasable]
    
    init(total: Int, totalPages: Int, page: Int, perPage: Int, vods: [Teasable]) {
        
        self.total = total
        self.totalPages = totalPages
        self.page = page
        self.perPage = perPage
        self.vods = vods
    }
}
