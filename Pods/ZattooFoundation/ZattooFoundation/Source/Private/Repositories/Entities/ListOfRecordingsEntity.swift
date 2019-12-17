//
//  ListOfRecordingsEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero on 13.03.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ListOfRecordingsEntity: Codable {

    let recordings: [RecordingEntity]
    let recordedTvSeries: [SeriesSummaryEntity]
}
