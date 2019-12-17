//
//  SeriesTeaserModel.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 11/10/18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


struct SeriesTeaserModel {
    let cid: ChannelId
    let title: String
    let imageToken: String
    let tvSeriesId: SeriesId
    let isSeriesRecordingEligible: Bool
    let isRecordingsOnly: Bool
}
