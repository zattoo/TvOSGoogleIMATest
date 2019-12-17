//
//  ZattooPageResponse.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooPageResponse: SwiftyJsonResponseSerializable {
    var page: PageEntity
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init(json: JSON) {
        page = PageEntity(json: json)
    }
}
