//
//  ZattooVodSubscriptionsResponse.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 8/17/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooVodSubscriptionsResponse: SwiftyJsonResponseSerializable {

    let vodSubscriptions: VodSubscriptionsEntity

    // MARK: - SwiftyJsonResponseSerializable

    init(json: JSON) {
        vodSubscriptions = VodSubscriptionsEntity(json: json)
    }
}

