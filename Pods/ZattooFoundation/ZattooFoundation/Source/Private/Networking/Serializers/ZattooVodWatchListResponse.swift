//
//  ZattooVodWatchListResponse.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/4/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooVodWatchListResponse: SwiftyJsonResponseSerializable {

    let vodWatchList: VodWatchListEntity

    // MARK: - SwiftyJsonResponseSerializable

    init(json: JSON) {
        vodWatchList = VodWatchListEntity(json: json)
    }
}
