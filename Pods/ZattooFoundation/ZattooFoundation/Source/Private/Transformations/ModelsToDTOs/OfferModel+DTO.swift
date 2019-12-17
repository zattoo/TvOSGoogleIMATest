//
//  OfferModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 29.08.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation

extension OfferModel: DTOConvertible {
    
    var DTO: Offer {
        return Offer(id: id, title: title, displayPrice: displayPrice, offerDescription: offerDescription, pinRequired: pinRequired)
    }
}

