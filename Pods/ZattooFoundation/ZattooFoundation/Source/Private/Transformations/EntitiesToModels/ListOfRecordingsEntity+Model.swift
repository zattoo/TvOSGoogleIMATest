//
//  ListOfRecordingsEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 13.03.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension ListOfRecordingsEntity: ModelConvertible {

    var model: ListOfRecordingsModel {
        return ListOfRecordingsModel(recordings: recordings.map { $0.model },
                                     recordedTvSeries: recordedTvSeries.map { $0.model })
    }
}

