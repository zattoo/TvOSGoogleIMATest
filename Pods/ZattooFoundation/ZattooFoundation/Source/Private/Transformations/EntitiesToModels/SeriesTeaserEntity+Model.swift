//
//  SeriesTeaserEntity+Model.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 11/10/18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension SeriesTeaserEntity: ModelConvertible {
    
    var model: SeriesTeaserModel {
        return SeriesTeaserModel(cid: cid, title: title, imageToken: imageToken, tvSeriesId: NSNumber(value: tvSeriesId), isSeriesRecordingEligible: isSeriesRecordingEligible, isRecordingsOnly: isRecordingsOnly)
    }
}
