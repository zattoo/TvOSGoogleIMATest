//
//  PageEntity.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension PageEntity {
    
    init(json: JSON) {
        title = json["title"].stringValue
        publicId = json["public_id"].stringValue
        logoToken = json["logo_token"].string
        pageElements = json["elements"].transformEachElement(toPageElementEntity)
        ad = toEditorialAdEntity(json: json["ad"])
        subNavigationPublicId = json["sub_navigation_public_id"].string
        displayEmptyRecordings = json["display_empty_recordings"].boolValue
        navigationContext = json["navigation_context"].navigationContextValue
        
        let styleString = json["style"].stringValue
        switch styleString {
        case "only_first_element":
            style = .onlyFirstElement
        case "selectable_elements":
            style = .selectableElements
        default:
            style = .stackedElements
        }
        displayTotalRecordings = json["display_total_recordings"].boolValue
    }
}

// MARK: - Private

private func toEditorialAdEntity(json: JSON) -> EditorialAdEntity? {
    return EditorialAdEntity(json: json)
}

private func toPageElementEntity(json: JSON) -> PageElementEntity {
    return PageElementEntity(json: json)
}
