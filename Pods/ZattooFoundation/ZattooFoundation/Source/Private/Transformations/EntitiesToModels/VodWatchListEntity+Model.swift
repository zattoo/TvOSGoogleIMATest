//
//  VodWatchListEntity+Model.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/4/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodWatchListEntity: ModelConvertible {

    var model: VodWatchListModel {
        var watchList = [TeasableTypeModel: [TeasableId: VodWatchListItemModel]]()
        for (key, value) in self.watchList {
            watchList[key.model] = value.mapValues { $0.model }
        }
        return VodWatchListModel(watchList: watchList)
    }
}
