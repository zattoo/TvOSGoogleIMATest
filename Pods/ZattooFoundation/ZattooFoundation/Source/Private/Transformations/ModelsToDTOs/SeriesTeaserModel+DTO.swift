//
//  SeriesTeaserModel+DTO.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 11/10/18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension SeriesTeaserModel: DTOConvertible {

    var DTO: SeriesTeaser {
        return SeriesTeaser(cid: cid, title: title, imageToken: imageToken, tvSeriesId: tvSeriesId, isSeriesRecordingEligible: isSeriesRecordingEligible, isRecordingsOnly: isRecordingsOnly)
    }
}
