//
//  ZattooPowerGuideResponse.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/28/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooPowerGuideResponse: SwiftyJsonResponseSerializable {
    let epg: [ChannelEPGEntity]
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init?(json: JSON) {
        guard json["success"].boolValue else { return nil }
        epg = json["channels"].transformEachElement(toChannelEPGEntity)
    }
}

// MARK: - Private

private func toChannelEPGEntity(json: JSON) -> ChannelEPGEntity? {
    return ChannelEPGEntity(json: json)
}
