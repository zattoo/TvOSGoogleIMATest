//
//  LanguageEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero on 04.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension LanguageEntity {
    
    init(json: JSON) {
        code = json.stringValue.uppercased()
        name = json.iso639StringValue
    }
}
