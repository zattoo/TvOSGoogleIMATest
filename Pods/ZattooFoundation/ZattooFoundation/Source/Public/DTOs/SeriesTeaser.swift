//
//  SeriesTeaser.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 11/10/18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class SeriesTeaser: NSObject, Teasable {

    public let cid: ChannelId
    public let title: String
    public let imageToken: String?
    public let tvSeriesId: SeriesId
    public let isSeriesRecordingEligible: Bool
    public let isRecordingsOnly: Bool
    
    init(cid: ChannelId, title: String, imageToken: String, tvSeriesId: SeriesId, isSeriesRecordingEligible: Bool, isRecordingsOnly: Bool) {
        self.cid = cid
        self.title = title
        self.imageToken = imageToken
        self.tvSeriesId = tvSeriesId
        self.isSeriesRecordingEligible = isSeriesRecordingEligible
        self.isRecordingsOnly = isRecordingsOnly
    }
}
