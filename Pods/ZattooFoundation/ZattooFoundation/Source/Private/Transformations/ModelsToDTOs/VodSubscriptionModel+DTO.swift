//
//  VodSubscriptionModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 8/18/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodSubscriptionModel: DTOConvertible {

    var DTO: VodSubscription {
        return VodSubscription()
    }
}
