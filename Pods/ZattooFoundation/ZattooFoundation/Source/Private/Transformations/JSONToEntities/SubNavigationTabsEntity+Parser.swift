//
//  SubNavigationTabsEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero on 29.07.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension SubNavigationTabsEntity {
    
    init(json: JSON) {
        publicId = json["public_id"].stringValue
        tabs = json["sub_navigation_tabs"].transformEachElement(toSubNavigationTabEntity)      
    }
}

// MARK: - Private

private func toSubNavigationTabEntity(json: JSON) -> SubNavigationTabEntity? {
    return SubNavigationTabEntity(json: json)
}
