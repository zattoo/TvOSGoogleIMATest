//
//  SeriesSummaryEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 1/20/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension SeriesSummaryEntity {
    
    init(json: JSON) {
        seriesId = json["tv_series_id"].intValue
        cid = json["cid"].stringValue
    }
}
