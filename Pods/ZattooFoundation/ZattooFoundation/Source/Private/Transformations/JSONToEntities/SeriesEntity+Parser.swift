//
//  SeriesEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Abraham Tomás Díaz Abreu on 20/10/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension SeriesEntity {
    
    init?(json: JSON?) {
        guard let json = json else { return nil }
        id = json["tv_series_id"].intValue
        numTotal = json["num_total"].intValue
        numRecorded = json["num_recorded"].intValue
        isAddingAsync = json["async"].boolValue
    }
}
