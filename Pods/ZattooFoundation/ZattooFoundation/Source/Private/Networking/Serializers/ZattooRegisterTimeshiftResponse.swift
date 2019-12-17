//
//  ZattooRegisterTimeshiftResponse.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 9/12/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooRegisterTimeshiftResponse: SwiftyJsonResponseSerializable {
    let registerTimeshift: RegisterTimeshiftEntity
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init(json: JSON) {
        registerTimeshift = RegisterTimeshiftEntity(json: json)
    }
}
