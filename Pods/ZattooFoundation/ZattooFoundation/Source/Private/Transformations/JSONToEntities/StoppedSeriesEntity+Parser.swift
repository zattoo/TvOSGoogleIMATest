//
//  StoppedSeriesEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 1/19/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension StoppedSeriesEntity {
    
    init(json: JSON) {
        self.numberOfFutureRecordingsDeleted = json["num_deleted"].intValue
        self.isDeletingAsync = json["async"].boolValue
    }
}
