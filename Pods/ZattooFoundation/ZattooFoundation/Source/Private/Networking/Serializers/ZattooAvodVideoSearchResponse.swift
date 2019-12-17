//
//  ZattooAvodVideoSearchResponse.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 7/7/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooAvodVideoSearchResponse: SwiftyJsonResponseSerializable {
    let avodVideos: [AvodVideoEntity]
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init(json: JSON) {
        avodVideos = json["avod_videos"].transformEachElement(toAvodVideoEntity)
    }
}

// MARK: - Private

private func toAvodVideoEntity(json: JSON) -> AvodVideoEntity? {
    return AvodVideoEntity(json: json)
}
