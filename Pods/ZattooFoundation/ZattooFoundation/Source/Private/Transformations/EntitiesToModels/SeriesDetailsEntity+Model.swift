//
//  SeriesDetailsEntity+Model.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 18.10.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension SeriesDetailsEntity: ModelConvertible {

    var model: SeriesDetailsModel {
        return SeriesDetailsModel(
            tvSeriesId: NSNumber(value: tvSeriesId),
            numTotalEpisodes: numTotalEpisodes,
            numAvailableEpisodes: numAvailableEpisodes,
            numFutureEpisodes: numFutureEpisodes,
            isSeriesRecordingEligible: isSeriesRecordingEligible,
            isSeriesRecordingActive: isSeriesRecordingActive,
            title: title,
            cid: cid,
            imageToken: imageToken,
            sortings: sortings.map { $0.model },
            currentSorting: currentSorting,
            programs: programs.map { $0.model },
            seasonNumbers: seasonNumbers,
            currentSeasonNumber: currentSeasonNumber,
            displayManageRecordings: displayManageRecordings
        )
    }
}
