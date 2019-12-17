//
//  ConsentEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 29.08.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension ConsentEntity {

    init(json: JSON) {
        id = json["identifier"].stringValue
        value = json["value"].bool
        confirmationOnly = json["confirmation_only"].boolValue
        title = json["title"].stringValue
        linkTitle = json["link_title"].stringValue
        infoText = json["description"].stringValue
        redirectUrl = json["redirect_url"].url
        embedUrl = json["embed_url"].url
        plainTextUrl = json["plaintext_url"].url
    }
}
