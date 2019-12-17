//
//  Channel.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 4/14/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


public typealias ChannelId = String

final public class Channel: NSObject {

    public let cid: ChannelId
    public let qualityInfo: QualityInfo
    public let isRecordingAvailable: Bool
    public let title: String
    public let isAvailable: Bool
    
    init(cid: ChannelId, qualityInfo: QualityInfo, isRecordingAvailable: Bool, title: String, isAvailable: Bool) {
        self.cid = cid
        self.qualityInfo = qualityInfo
        self.isRecordingAvailable = isRecordingAvailable
        self.title = title
        self.isAvailable = isAvailable
    }
}
