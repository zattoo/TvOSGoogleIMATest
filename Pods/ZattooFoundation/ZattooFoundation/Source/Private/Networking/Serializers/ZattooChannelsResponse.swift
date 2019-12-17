//
//  ZattooChannelsResponse.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooChannelsResponse: SwiftyJsonResponseSerializable {
    let channelGroups: [ChannelGroupEntity]
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init?(json: JSON) {
        guard json["success"].boolValue else { return nil }
        channelGroups = json["channel_groups"].transformEachElement(toChannelGroupEntity)
    }
}

// MARK: - Private

private func toChannelGroupEntity(json: JSON) -> ChannelGroupEntity? {
    let channelEntities = json["channels"].transformEachElement(toChannelEntity)
    
    guard !channelEntities.isEmpty, let name = json["name"].string else {
        return nil
    }
    
    return ChannelGroupEntity(name: name, channelEntities: channelEntities)
}

private func toChannelEntity(json: JSON) -> ChannelEntity {
    return ChannelEntity(json: json)
}
