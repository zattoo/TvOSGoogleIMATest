//
//  ZattooDisplayAdResponse.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.04.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooDisplayAdResponse: SwiftyJsonResponseSerializable {
    let displayAd: DisplayAdEntity?

    // MARK: - SwiftyJsonResponseSerializable

    init(json: JSON) {
        displayAd = DisplayAdEntity(json: json)
    }
}
