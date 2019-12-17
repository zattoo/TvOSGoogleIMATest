//
//  VodSearchResultEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero on 01.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension VodSearchResultEntity {
    
    init(json: JSON) {
        total = json["total_count"].intValue
        totalPages = json["total_pages"].intValue
        page = json["page"].intValue
        perPage = json["per_page"].intValue
        vods = json["results"].transformEachElement(toVodEntity)
    }
}

private func toVodEntity(json: JSON) -> Any? {
    let teasableType = json["result_type"].teasableTypeEntityValue

    let entity: Any?
    if teasableType == .vodMovie {
        entity = VodMovieEntity(json: json["result"])
    }
    else if teasableType == .vodSeries {
        entity = VodSeriesEntity(json: json["result"])
    }
    else {
        entity = nil
    }
    return entity
}
