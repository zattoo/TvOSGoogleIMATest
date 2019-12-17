//
//  MinimumConnectivityModel+DTO.swift
//  ZattooFoundation
//
//  Created by Abraham Tomas Diaz Abreu on 30.06.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension MinimumConnectivityModel: DTOConvertible {
    
    var DTO: MinimumConnectivity {
        switch self {
        case .wifi:
            return .wifi
        }
    }
}
