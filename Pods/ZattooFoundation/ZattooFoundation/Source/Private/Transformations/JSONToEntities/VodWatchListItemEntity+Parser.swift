//
//  VodWatchListItemEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/2/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension VodWatchListItemEntity {

    init?(json: JSON) {
        guard let teasableType = json["teasable_type"].teasableTypeEntity else {
            return nil
        }

        teasableId = json["teasable_id"].stringValue
        self.teasableType = teasableType
        createdAt = json["created_at"].dateValue
    }
}
