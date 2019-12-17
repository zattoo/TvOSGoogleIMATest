//
//  VodStatusCollectionEntity+Model.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/25/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodStatusCollectionEntity {

    func model(with subscriptions: VodSubscriptionsModel) -> VodStatusCollectionModel {
        var statuses = VodStatusesModel()
        for (key, statusEntities) in self.statuses {
            let teasableType = key.model
            var status = VodStatusModelDictionary()
            for (teasableId, statusEntity) in statusEntities {
                status[teasableId] = statusEntity.model
            }
            statuses[teasableType] = status
        }
        return VodStatusCollectionModel(statuses: statuses, subscriptions: subscriptions)
    }
}
