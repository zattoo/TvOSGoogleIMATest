//
//  PageElementContentEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension PageElementContentEntity {
    
    init(json: JSON) {
        perPage = json["per_page"].intValue
        
        if let styleString = json["style"].string, let style = PageElementStyleEntity(rawValue: styleString) {
            self.style = style
        } else {
            style = .generic
        }
        
        publicId = json["teaser_collection_public_id"].stringValue

    }
    
}
