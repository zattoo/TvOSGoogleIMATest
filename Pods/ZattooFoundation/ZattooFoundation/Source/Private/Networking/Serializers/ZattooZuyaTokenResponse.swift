//
//  ZattooZuyaTokenResponse.swift
//  ZattooFoundation
//
//  Created by David Cordero on 06.12.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooZuyaTokenResponse: SwiftyJsonResponseSerializable {
    let zuyaToken: String
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init?(json: JSON) {
        guard json["success"].boolValue else { return nil }
        zuyaToken = json["zuya_token"].stringValue
    }
}
