//
//  ChannelGroupEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 4/20/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ChannelGroupEntity: Codable {
    
    let name: String
    let channelEntities: [ChannelEntity]
}
