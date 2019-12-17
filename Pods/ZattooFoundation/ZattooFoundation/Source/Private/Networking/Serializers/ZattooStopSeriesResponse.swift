//
//  ZattooStopSeriesResponse.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 1/19/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooStopSeriesResponse: SwiftyJsonResponseSerializable {
    let stoppedSeriesEntity: StoppedSeriesEntity
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init?(json: JSON) {
        guard json["success"].boolValue else { return nil }
        stoppedSeriesEntity = StoppedSeriesEntity(json: json)
    }
}
