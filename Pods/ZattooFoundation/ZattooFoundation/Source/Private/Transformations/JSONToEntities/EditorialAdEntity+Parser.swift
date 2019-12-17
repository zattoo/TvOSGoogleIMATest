//
//  EditorialAdEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 27.02.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension EditorialAdEntity {

    init?(json: JSON) {
        guard let zapiPath = json["zapi_path"].string,
            let type = EditorialAdTypeEntity(rawValue: json["type"].stringValue) else {
                return nil
        }

        self.zapiPath = zapiPath
        self.type = type
        style = json["style"].stringValue
    }
}
