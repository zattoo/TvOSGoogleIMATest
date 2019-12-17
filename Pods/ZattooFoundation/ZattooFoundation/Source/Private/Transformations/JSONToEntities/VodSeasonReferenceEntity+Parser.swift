//
//  VodSeasonReferenceEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero on 30.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON

extension VodSeasonReferenceEntity {
    
    init(json: JSON) {
        id = json["id"].stringValue
        number = json["number"].intValue
    }
}
