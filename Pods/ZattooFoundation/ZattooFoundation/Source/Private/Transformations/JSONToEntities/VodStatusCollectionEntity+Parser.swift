//
//  VodStatusCollectionEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/22/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension VodStatusCollectionEntity {

    init(json: JSON) {
        var statuses = VodStatusesEntity()
        for (key, statusesJson) in json.dictionaryValue {
            let teasableType = TeasableTypeEntity(rawValue: key) ?? .generic
            var status = VodStatusEntityDictionary()
            for (teasableId, statusJson) in statusesJson.dictionaryValue {
                status[teasableId] = VodStatusEntity(json: statusJson)
            }
            statuses[teasableType] = status
        }
        self.statuses = statuses
    }
}
