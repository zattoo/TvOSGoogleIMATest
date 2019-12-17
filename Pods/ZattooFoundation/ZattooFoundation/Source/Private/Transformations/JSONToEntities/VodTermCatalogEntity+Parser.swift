//
//  VodTermCatalogEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero on 07.03.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension VodTermsCatalogEntity {
    
    init?(json: JSON) {
        let vodTypeString = json["vod_type"].stringValue
        guard let vodType = VodTypeEntity(rawValue: vodTypeString) else {
            return nil
        }
    
        self.vodType = vodType
        terms = json["terms"].arrayValue.compactMap({ VodTermEntity(json: $0) })
        disclaimer = json["disclaimer"].string
    }
}
