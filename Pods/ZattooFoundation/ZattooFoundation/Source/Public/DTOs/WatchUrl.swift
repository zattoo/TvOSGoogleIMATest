//
//  WatchUrl.swift
//  ZattooFoundation
//
//  Created by Abraham Tomas Diaz Abreu on 21.06.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc(ZattooFoundationWatchUrl)
final public class WatchUrl: NSObject {
    
    public let audioChannel: AudioChannel
    public let url: URL
    public let maxRate: Int
    
    init(audioChannel: AudioChannel,
         url: URL,
         maxRate: Int) {
        
        self.audioChannel = audioChannel
        self.url = url
        self.maxRate = maxRate
    }
}
