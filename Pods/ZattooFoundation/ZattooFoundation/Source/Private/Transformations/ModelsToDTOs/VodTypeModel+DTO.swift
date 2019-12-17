//
//  VodTypeModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/27/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodTypeModel: DTOConvertible {

    var DTO: VodType {
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
