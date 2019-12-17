//
//  RecordingModel.swift
//  ZattooFoundation
//
//  Created by David Cordero on 18/08/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct RecordingModel {
    let id: RecordingId
    let cid: ChannelId
    let title: String
    let episodeTitle: String?
    let start: Date
    let end: Date
    let programId: ProgramId
    let lastPosition: TimeInterval
    let isPartial: Bool
    let imageToken: String?
    let isSeriesRecordingEligible: Bool
    let tvSeriesId: SeriesId?
    let qualityLevel: QualityLevelModel
    let isRestrictedQuality: Bool
    let expiration: Date?
    var isRecordedAsSeries: Bool
}
