//
//  Recording.swift
//  ZattooFoundation
//
//  Created by David Cordero on 18/08/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


public typealias RecordingId = NSNumber

@objc(ZattooFoundationRecording)
final public class Recording: NSObject {
    
    public let id: RecordingId
    public let cid: ChannelId
    public let title: String
    public let episodeTitle: String?
    public let start: Date
    public let end: Date
    public let programId: ProgramId
    public let lastPosition: TimeInterval
    public let isPartial: Bool
    public let imageToken: String?
    public let isSeriesRecordingEligible: Bool
    public let tvSeriesId: SeriesId?
    public let qualityLevel: QualityLevel
    public let isRestrictedQuality: Bool
    public let expiration: Date?
    public let isRecordedAsSeries: Bool
    
    init(id: RecordingId,
         cid: ChannelId,
         title: String,
         episodeTitle: String?,
         start: Date,
         end: Date,
         programId: ProgramId,
         lastPosition: TimeInterval,
         isPartial: Bool,
         imageToken: String?,
         isSeriesRecordingEligible: Bool,
         tvSeriesId: SeriesId?,
         qualityLevel: QualityLevel,
         isRestrictedQuality: Bool,
         expiration: Date?,
         isRecordedAsSeries: Bool) {

        self.id = id
        self.cid = cid
        self.title = title
        self.episodeTitle = episodeTitle
        self.start = start
        self.end = end
        self.programId = programId
        self.lastPosition = lastPosition
        self.isPartial = isPartial
        self.imageToken = imageToken
        self.isSeriesRecordingEligible = isSeriesRecordingEligible
        self.tvSeriesId = tvSeriesId
        self.qualityLevel = qualityLevel
        self.isRestrictedQuality = isRestrictedQuality
        self.expiration = expiration
        self.isRecordedAsSeries = isRecordedAsSeries
    }
}
