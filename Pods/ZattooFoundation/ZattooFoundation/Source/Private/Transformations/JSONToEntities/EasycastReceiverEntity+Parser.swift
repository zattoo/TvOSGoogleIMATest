//
//  EasycastReceiverEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 06.12.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension EasycastReceiverEntity {

    init?(json: JSON) {
        guard let state = json["state"].string,
            let deviceID = json["device_id"].string,
            let baseURL = json["base_url"].string else { return nil }

        self.state = state
        self.deviceID = deviceID
        self.baseURL = baseURL
        self.name = json["name"].string
    }
}
