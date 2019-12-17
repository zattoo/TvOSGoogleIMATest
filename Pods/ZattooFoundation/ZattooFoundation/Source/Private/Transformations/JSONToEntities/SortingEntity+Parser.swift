//
//  SortingEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 27.09.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension SortingEntity {

    init(json: JSON) {
        name = json["label"].stringValue
        value = json["param"].stringValue
    }
}
