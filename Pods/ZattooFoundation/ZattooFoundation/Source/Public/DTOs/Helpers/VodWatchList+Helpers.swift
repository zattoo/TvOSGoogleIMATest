//
//  VodWatchList+Helpers.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/4/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


public extension VodWatchList {

    func isOnWatchList(id: VodId, teasableType: TeasableType) -> Bool {
        return watchList[teasableType]?[id] != nil
    }
}
