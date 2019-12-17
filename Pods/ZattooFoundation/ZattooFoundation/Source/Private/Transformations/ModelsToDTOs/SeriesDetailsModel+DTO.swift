//
//  SeriesDetailsModel+DTO.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 18.10.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension SeriesDetailsModel: DTOConvertible {

    var DTO: SeriesDetails {
        return SeriesDetails(
            tvSeriesId: tvSeriesId,
            numTotalEpisodes: numTotalEpisodes,
            numAvailableEpisodes: numAvailableEpisodes,
            numFutureEpisodes: numFutureEpisodes,
            isSeriesRecordingEligible: isSeriesRecordingEligible,
            isSeriesRecordingActive: isSeriesRecordingActive,
            title: title,
            cid: cid,
            imageToken: imageToken,
            sortings: sortings.map { $0.seriesDTO },
            currentSorting: currentSorting,
            programs: programs.map { $0.DTO },
            seasonNumbers: seasonNumbers,
            currentSeasonNumber: currentSeasonNumber,
            displayManageRecordings: displayManageRecordings
        )
    }
}
