//
//  ZattooShopResponse.swift
//  ZattooFoundation
//
//  Created by David Cordero on 29.08.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooShopResponse: SwiftyJsonResponseSerializable {
    let offers: [OfferEntity]
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init?(json: JSON) {
        guard json["success"].boolValue else { return nil }
        offers = json["offers"].transformEachElement(toOfferEntity)
    }
}

// MARK: - Private

private func toOfferEntity(json: JSON) -> OfferEntity? {
    return OfferEntity(json: json)
}
