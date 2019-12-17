//
//  BrandEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 11/6/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension BrandEntity {

    init?(json: JSON) {
        guard !(json.rawValue is NSNull) else { return nil }
        id = json["id"].stringValue
        title = json["title"].stringValue
        logoToken = json["logo_token"].stringValue
    }
}
