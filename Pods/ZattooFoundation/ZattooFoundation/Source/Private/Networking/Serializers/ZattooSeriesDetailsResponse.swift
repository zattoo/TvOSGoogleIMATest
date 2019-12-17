//
//  ZattooSeriesDetailsResponse.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 18.10.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooSeriesDetailsResponse: SwiftyJsonResponseSerializable {
    let series: SeriesDetailsEntity

    // MARK: - SwiftyJsonResponseSerializable

    init?(json: JSON) {
        guard json["success"].boolValue else { return nil }

        guard let seriesEntity = SeriesDetailsEntity(json: json["series"]) else {
            return nil
        }

        series = seriesEntity
    }
}
