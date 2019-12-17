//
//  ZattooVodOrderResponse.swift
//  ZattooFoundation
//
//  Created by David Cordero on 05.03.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooVodOrderResponse: SwiftyJsonResponseSerializable {
    let statusEntity: VodStatusEntity
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init?(json: JSON) {
        statusEntity = VodStatusEntity(json: json)
    }
}
