//
//  ZattooVodMovieResponse.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/15/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooVodMovieResponse: SwiftyJsonResponseSerializable {
    let vodMovie: VodMovieEntity

    // MARK: - SwiftyJsonResponseSerializable

    init(json: JSON) {
        vodMovie = VodMovieEntity(json: json)
    }
}
