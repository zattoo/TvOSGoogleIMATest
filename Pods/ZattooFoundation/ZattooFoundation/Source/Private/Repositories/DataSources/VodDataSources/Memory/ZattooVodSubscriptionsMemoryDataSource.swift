//
//  ZattooVodSubscriptionsMemoryDataSource.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 8/18/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


final class ZattooVodSubscriptionsMemoryDataSource: GenericMemoryDataSource<VodSubscriptionsEntity> {

    static let shared: ZattooVodSubscriptionsMemoryDataSource = {
        return ZattooVodSubscriptionsMemoryDataSource()
    }()
}
