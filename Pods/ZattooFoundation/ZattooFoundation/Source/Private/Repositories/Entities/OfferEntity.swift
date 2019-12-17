//
//  OfferEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero on 29.08.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


struct OfferEntity: Codable {
    let id: OfferId
    let title: String
    let displayPrice: String
    let offerDescription: String
    let pinRequired: Bool
}
