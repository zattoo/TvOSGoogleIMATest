//
//  ZattooSubNavigationsResponse.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 20.09.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooSubNavigationsResponse: SwiftyJsonResponseSerializable {
    let subNavigationTabsEntities: SubNavigationTabsEntity

    // MARK: - SwiftyJsonResponseSerializable

    init?(json: JSON) {
        subNavigationTabsEntities = SubNavigationTabsEntity(json: json)
    }
}

