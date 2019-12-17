//
//  ZattooVodStatusUpdateResponse.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/8/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooVodStatusUpdateResponse: SwiftyJsonResponseSerializable {
    let vodStatusUpdateResultEntity: VodStatusUpdateResultEntity

    // MARK: - SwiftyJsonResponseSerializable

    init(json: JSON) {
        vodStatusUpdateResultEntity = VodStatusUpdateResultEntity(json: json)
    }
}
