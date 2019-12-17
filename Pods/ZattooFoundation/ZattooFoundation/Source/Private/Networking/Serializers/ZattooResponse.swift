//
//  ZattooResponse.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/2/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooResponse: SwiftyJsonResponseSerializable {
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init?(json: JSON) {
        guard json["success"].boolValue else { return nil }
    }
}
