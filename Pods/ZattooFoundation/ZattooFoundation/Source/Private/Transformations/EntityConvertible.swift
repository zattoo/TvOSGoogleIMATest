//
//  EntityConvertible.swift
//  ZattooFoundation
//
//  Created by David Cordero on 21.05.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol EntityConvertible {
    
    associatedtype EntityType
    
    var entity: EntityType { get }
}
