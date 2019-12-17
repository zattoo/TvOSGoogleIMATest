//
//  VodWatchListItemEntity+Model.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/4/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodWatchListItemEntity: ModelConvertible {

    var model: VodWatchListItemModel {
        VodWatchListItemModel(
            teasableId: teasableId,
            teasableType: teasableType.model,
            createdAt: createdAt
        )
    }
}
