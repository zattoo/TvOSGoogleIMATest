//
//  OfferEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 29.08.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension OfferEntity: ModelConvertible {
    
    var model: OfferModel {
        return OfferModel(id: id, title: title, displayPrice: displayPrice, offerDescription: offerDescription, pinRequired: pinRequired)
    }
}

