//
//  ZattooVodStatusResponse.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/26/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooVodStatusResponse: SwiftyJsonResponseSerializable {
    let vodStatusCollection: VodStatusCollectionEntity

    // MARK: - SwiftyJsonResponseSerializable

    init(json: JSON) {
        vodStatusCollection = VodStatusCollectionEntity(json: json)
    }
}
