//
//  Offer.swift
//  ZattooFoundation
//
//  Created by David Cordero on 29.08.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


public typealias OfferId = String

final public class Offer: NSObject {
    
    public let id: OfferId
    public let title: String
    public let displayPrice: String
    public let offerDescription: String
    public let pinRequired: Bool
    
    init(id: OfferId,
         title: String,
         displayPrice: String,
         offerDescription: String,
         pinRequired: Bool) {
        
        self.id = id
        self.title = title
        self.displayPrice = displayPrice
        self.offerDescription = offerDescription
        self.pinRequired = pinRequired
    }
}
