//
//  MinimumConnectivityEntity+Model.swift
//  ZattooFoundation
//
//  Created by Abraham Tomas Diaz Abreu on 30.06.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension MinimumConnectivityEntity: ModelConvertible {
    
    var model: MinimumConnectivityModel {
        switch self {
        case .wifi:
            return .wifi
        }
    }
}
