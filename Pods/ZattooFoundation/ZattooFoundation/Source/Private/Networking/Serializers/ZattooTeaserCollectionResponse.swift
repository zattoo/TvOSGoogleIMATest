//
//  ZattooTeaserCollectionResponse.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/26/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooTeaserCollectionResponse: SwiftyJsonResponseSerializable {
    let teaserCollection: TeaserCollectionEntity
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init(json: JSON) {
        teaserCollection = TeaserCollectionEntity(json: json)
    }
}
