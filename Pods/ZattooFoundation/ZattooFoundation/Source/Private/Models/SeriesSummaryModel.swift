//
//  SeriesSummaryModel.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 1/20/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


struct SeriesSummaryModel: Equatable {
    let seriesId: SeriesId
    let cid: ChannelId

    static func==(lhs: SeriesSummaryModel, rhs: SeriesSummaryModel) -> Bool {
        return lhs.cid == rhs.cid && lhs.seriesId == rhs.seriesId
    }
}
