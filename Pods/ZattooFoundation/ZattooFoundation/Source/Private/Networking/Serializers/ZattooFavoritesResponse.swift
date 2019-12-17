//
//  ZattooFavoritesResponse.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/17/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooFavoritesResponse: SwiftyJsonResponseSerializable {
    let channelIds: [String]
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init?(json: JSON) {
        guard json["success"].boolValue else { return nil }
        channelIds = json["favorites"].arrayValue.compactMap { $0.string }
    }
}
