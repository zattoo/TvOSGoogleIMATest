//
//  VodWatchListModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/4/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodWatchListModel: DTOConvertible {

    var DTO: VodWatchList {
        var watchList = [TeasableType: [TeasableId: VodWatchListItem]]()
        for (key, value) in self.watchList {
            watchList[key.DTO] = value.mapValues { $0.DTO }
        }
        return VodWatchList(watchList: watchList)
    }
}
