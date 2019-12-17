//
//  WatchUrlEntity.swift
//  ZattooFoundation
//
//  Created by Abraham Tomas Diaz Abreu on 21.06.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


struct WatchUrlEntity: Codable {
    
    let audioChannel: AudioChannelEntity
    let url: URL
    let maxRate: Int
    
}
