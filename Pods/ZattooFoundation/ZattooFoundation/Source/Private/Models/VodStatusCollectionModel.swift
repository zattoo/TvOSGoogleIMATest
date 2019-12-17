//
//  VodStatusCollectionModel.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/25/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


typealias VodStatusModelDictionary = [TeasableId: VodStatusModel]
typealias VodStatusesModel = [TeasableTypeModel: VodStatusModelDictionary]

struct VodStatusCollectionModel {

    let statuses: VodStatusesModel
    let subscriptions: VodSubscriptionsModel
}
