//
//  DTOConvertible.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/15/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol DTOConvertible {
    
    associatedtype DTOType
    
    var DTO: DTOType { get }
}
