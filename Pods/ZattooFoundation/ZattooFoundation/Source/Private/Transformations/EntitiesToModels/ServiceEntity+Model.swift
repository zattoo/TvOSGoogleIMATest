//
//  ServiceEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 21.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension ServiceEntity: ModelConvertible {
    
    var model: ServiceModel {
        return ServiceModel(id: id, name: name, type: type, subservices: subservices)
    }
}
