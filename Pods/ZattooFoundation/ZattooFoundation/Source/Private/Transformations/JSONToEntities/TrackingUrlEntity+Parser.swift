//
//  TrackingUrlEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero on 08.11.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension TrackingUrlEntity {
    
    init?(json: JSON) {
        guard let event = json["event"].string,
            let url = json["url"].url else {
                return nil
        }
        
        self.event = event
        self.url = url
    }
}
