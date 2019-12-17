//
//  ListOfRecordingsEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero on 13.03.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension ListOfRecordingsEntity {

    init(json: JSON) {
        recordings = json["recordings"].transformEachElement(toRecordingEntity)
        recordedTvSeries = json["recorded_tv_series"].transformEachElement(toSeriesSummaryEntity)
    }
}

private func toRecordingEntity(json: JSON) -> RecordingEntity? {
    return RecordingEntity(json: json)
}

private func toSeriesSummaryEntity(json: JSON) -> SeriesSummaryEntity {
    return SeriesSummaryEntity(json: json)
}
