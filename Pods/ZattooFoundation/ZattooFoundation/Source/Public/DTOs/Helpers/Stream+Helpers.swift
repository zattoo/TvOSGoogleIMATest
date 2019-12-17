//
//  Stream+Helpers.swift
//  ZattooFoundation
//
//  Created by Abraham Tomas Diaz Abreu on 30.06.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


public extension Stream {
    
    var isDualAudio: Bool {
        return watchUrls.lazy.contains { $0.audioChannel == .b }
    }
    
    @objc func audioChannel(for url: URL) -> AudioChannel {
        return watchUrls.lazy.filter { $0.url == url }.first?.audioChannel ?? .unknown
    }
    
    @objc func url(for audioChannel: AudioChannel, maxBitrate: Int) -> URL {
        var url = self.url
        var currentLimit = 0
        let bitrateLimit = maxBitrate == 0 ? .max : maxBitrate
        
        watchUrls.forEach {
            guard $0.audioChannel == audioChannel else { return }
            let bitrate = $0.maxRate == 0 ? .max : $0.maxRate
            
            if bitrate <= bitrateLimit && bitrate >= currentLimit {
                url = $0.url
                currentLimit = bitrate
            }
        }
        
        return url
    }
}
