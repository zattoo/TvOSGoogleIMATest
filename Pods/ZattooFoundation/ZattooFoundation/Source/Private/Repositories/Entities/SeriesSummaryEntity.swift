//
//  SeriesSummaryEntity.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 1/20/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


struct SeriesSummaryEntity: Codable {
    let seriesId: Int
    let cid: ChannelId

    static func==(lhs: SeriesSummaryEntity, rhs: SeriesSummaryEntity) -> Bool {
        return lhs.cid == rhs.cid && lhs.seriesId == rhs.seriesId
    }
}
