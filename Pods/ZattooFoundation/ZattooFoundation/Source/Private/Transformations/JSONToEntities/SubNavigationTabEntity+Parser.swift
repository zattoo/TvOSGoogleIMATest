//
//  SubNavigationTabEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 20.09.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension SubNavigationTabEntity {

    init(json: JSON) {
        contentId = json["content_id"].stringValue
        contentType = json["content_type"].teasableTypeEntityValue
        title = json["title"].stringValue
    }
}
