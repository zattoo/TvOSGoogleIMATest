//
//  VodSeasonReference.swift
//  ZattooFoundation
//
//  Created by David Cordero on 30.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


@objcMembers
final public class VodSeasonReference: NSObject {
    public let id: VodId
    public let number: Int
    
    init(id: VodId, number: Int) {
        self.id = id
        self.number = number
    }
}
