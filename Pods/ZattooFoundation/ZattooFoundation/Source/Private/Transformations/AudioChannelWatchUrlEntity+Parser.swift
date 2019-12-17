//
//  AudioChannelWatchUrlEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Abraham Tomas Diaz Abreu on 21.06.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension WatchUrlEntity {
    
    init?(json: JSON) {
        guard let url = json["url"].url else { return nil }
        
        self.url = url
        maxRate = json["maxrate"].intValue
        let audioChannelString = json["audio_channel"].stringValue
        
        switch audioChannelString {
        case "A":
            audioChannel = .a
        case "B":
            audioChannel = .b
        default:
            audioChannel = .unknown
        }
    }
}
