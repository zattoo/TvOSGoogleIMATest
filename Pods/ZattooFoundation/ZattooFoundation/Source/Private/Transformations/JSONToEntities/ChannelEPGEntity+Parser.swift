//
//  ChannelEPGEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/4/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension ChannelEPGEntity {
    
    init(json: JSON) {
        cid = json["cid"].stringValue
        programs = json["programs"].transformEachElement(toProgramEntity)
    }
}
