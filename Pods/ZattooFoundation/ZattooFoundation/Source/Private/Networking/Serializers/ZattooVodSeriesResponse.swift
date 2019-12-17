//
//  ZattooVodSeriesResponse.swift
//  ZattooFoundation
//
//  Created by David Cordero on 02.05.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooVodSeriesResponse: SwiftyJsonResponseSerializable {
    let vodSeries: VodSeriesEntity
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init(json: JSON) {
        vodSeries = VodSeriesEntity(json: json)
    }
}
