//
//  ChannelGroupModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/15/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension ChannelGroupModel: DTOConvertible {
    
    var DTO: ChannelGroup {
        let channels = channelModels.map { $0.DTO }.compactMap { $0 }
        return ChannelGroup(name: name, channels: channels)
    }
}
