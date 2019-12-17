//
//  ServiceEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero on 07.12.16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension ServiceEntity {
    
    init(json: JSON) {
        id = json["id"].int
        name = json["name"].string
        type = json["type"].string
        subservices = json["subservices"].transformEachElement { $0.intValue }
    }
}
