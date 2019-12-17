//
//  OfferEntity+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero on 29.08.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension OfferEntity {
    
    init(json: JSON) {
        id = json["offer_id"].stringValue
        title = json["title"].stringValue
        displayPrice = json["display_price"].stringValue
        offerDescription = json["description"].stringValue
        pinRequired = json["pin_required"].boolValue
    }
}
