//
//  RecordingEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero on 18/08/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct RecordingEntity: Codable {
    
    let id: Int
    let cid: ChannelId
    let title: String
    let episodeTitle: String?
    let start: Date
    let end: Date
    let programId: Int
    let lastPosition: TimeInterval
    let isPartial: Bool
    let imageToken: String?
    let isSeriesRecordingEligible: Bool
    let tvSeriesId: Int?
    let qualityLevel: QualityLevelEntity
    let isRestrictedQuality: Bool
    let expiration: Date?
}
