//
//  SeriesSummaryEntity+Model.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 1/20/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension SeriesSummaryEntity: ModelConvertible {
    
    var model: SeriesSummaryModel {
        return SeriesSummaryModel(seriesId: NSNumber(value: seriesId), cid: cid)
    }
}
