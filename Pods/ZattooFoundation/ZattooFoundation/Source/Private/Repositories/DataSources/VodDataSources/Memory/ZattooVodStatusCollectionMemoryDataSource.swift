//
//  ZattooVodStatusCollectionMemoryDataSource.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/26/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


final class ZattooVodStatusCollectionMemoryDataSource: GenericMemoryDataSource<VodStatusCollectionEntity> {

    static let shared: ZattooVodStatusCollectionMemoryDataSource = {
        return ZattooVodStatusCollectionMemoryDataSource()
    }()
}
