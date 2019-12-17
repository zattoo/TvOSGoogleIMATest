//
//  ServiceModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension ServiceModel: DTOConvertible {
    
    var DTO: Service {
        return Service(id: id, name: name, type: type, subservices: subservices)
    }
}
