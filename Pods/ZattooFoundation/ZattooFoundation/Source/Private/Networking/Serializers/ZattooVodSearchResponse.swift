//
//  ZattooVodSearchResponse.swift
//  ZattooFoundation
//
//  Created by David Cordero on 01.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooVodSearchResponse: SwiftyJsonResponseSerializable {
    let searchResult: VodSearchResultEntity
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init(json: JSON) {
        searchResult = VodSearchResultEntity(json: json)
    }
}
