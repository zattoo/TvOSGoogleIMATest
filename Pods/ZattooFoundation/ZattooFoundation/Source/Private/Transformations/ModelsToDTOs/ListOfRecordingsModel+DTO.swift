//
//  ListOfRecordingsModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 28.06.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension ListOfRecordingsModel: DTOConvertible {

    var DTO: ListOfRecordings {

        var recordingModelsWithSeriesInfo: [RecordingModel] = []
        for var recordingModel in recordings {
            if let seriesId = recordingModel.tvSeriesId {
                let seriesSummary = SeriesSummaryModel(seriesId: seriesId, cid: recordingModel.cid)
                if (recordedTvSeries.contains { $0 == seriesSummary }) {
                    recordingModel.isRecordedAsSeries = true
                }
                else {
                    recordingModel.isRecordedAsSeries = false
                }
            }
            recordingModelsWithSeriesInfo.append(recordingModel)
        }

        return ListOfRecordings(recordings: recordingModelsWithSeriesInfo.map { $0.DTO },
                                recordedTvSeries: recordedTvSeries.map { $0.DTO })
    }
}
