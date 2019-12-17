//
//  PageElementEntity.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension PageElementEntity {
    
    init(json: JSON) {
        zapiParams = Dictionary(uniqueKeysWithValues: json["element_zapi_params"].dictionary?.map { ($0.key, $0.value.stringValue) } ?? [] )
        zapiPath = json["element_zapi_path"].stringValue
        contentId = json["element_content_id"].stringValue
        contentType = PageElementContentTypeEntity(rawValue: json["element_content_type"].stringValue) ?? .notSupported
        content = PageElementContentEntity(json: json["content"])
        
        // will be set via the teaser collection or subnavigations call
        teaserCollection = nil
        subNavigationTabs = nil
    }
}
