//
//  VodStatusCollectionModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/25/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodStatusCollectionModel: DTOConvertible {

    var DTO: VodStatusCollection {
        var statuses = VodStatuses()
        for (key, statusesModels) in self.statuses {
            let teasableType = key.DTO
            var status = VodStatusDictionary()
            for (teasableId, statusModel) in statusesModels {
                status[teasableId] = statusModel.DTO
            }
            statuses[teasableType] = status
        }
        return VodStatusCollection(statuses: statuses, subscriptions: subscriptions.DTO)
    }
}
