//
//  ZattooVodWatchListMemoryDataSource.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/7/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


final class ZattooVodWatchListMemoryDataSource: GenericMemoryDataSource<VodWatchListEntity> {

    static let shared: ZattooVodWatchListMemoryDataSource = {
        return ZattooVodWatchListMemoryDataSource()
    }()
}
