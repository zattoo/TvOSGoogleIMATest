//
//  VodTypeEntity+Model.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/27/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodTypeEntity: ModelConvertible {

    var model: VodTypeModel {
        switch self {
        case .tvod:
            return .tvod
        case .est:
            return .est
        case .svod:
            return .svod
        }
    }
}
