//
//  SeriesSummary.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 1/20/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc(ZattooFoundationSeriesSummary)
final public class SeriesSummary: NSObject {
    
    public let seriesId: SeriesId
    public let cid: ChannelId
    
    init(seriesId: SeriesId, cid: ChannelId) {
        self.seriesId = seriesId
        self.cid = cid
    }
}
