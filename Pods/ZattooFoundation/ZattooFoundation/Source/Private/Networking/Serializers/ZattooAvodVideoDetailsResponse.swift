//
//  ZattooAvodVideoDetailsResponse.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 30.11.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooAvodVideoDetailsResponse: SwiftyJsonResponseSerializable {
    let avodVideo: AvodVideoEntity

    // MARK: - SwiftyJsonResponseSerializable

    init(json: JSON) {
        avodVideo = AvodVideoEntity(json: json)!
    }
}
