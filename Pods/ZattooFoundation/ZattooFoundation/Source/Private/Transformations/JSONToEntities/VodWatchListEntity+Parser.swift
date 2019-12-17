//
//  VodWatchListEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/2/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension VodWatchListEntity {

    init(json: JSON) {
        var watchlist = [TeasableTypeEntity: [TeasableId: VodWatchListItemEntity]]()
        for (teasableTypeString, json) in json.dictionaryValue {
            guard let teasableType = TeasableTypeEntity(rawValue: teasableTypeString) else { continue }
            let watchListItem = json.dictionaryValue.mapValues { VodWatchListItemEntity(json: $0) }.compactMapValues { $0 }
            watchlist[teasableType] = watchListItem
        }
        self.watchList = watchlist
    }
}
