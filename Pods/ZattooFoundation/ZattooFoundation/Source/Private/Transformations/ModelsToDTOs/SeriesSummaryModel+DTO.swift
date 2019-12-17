//
//  SeriesSummaryModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 1/20/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension SeriesSummaryModel: DTOConvertible {
    
    var DTO: SeriesSummary {
        return SeriesSummary(seriesId: seriesId, cid: cid)
    }
}
