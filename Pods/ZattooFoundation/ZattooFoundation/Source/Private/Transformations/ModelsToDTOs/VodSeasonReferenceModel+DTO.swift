//
//  VodSeasonReferenceModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 30.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodSeasonReferenceModel: DTOConvertible {
    
    var DTO: VodSeasonReference {
        return VodSeasonReference(
            id: id,
            number: number)
    }
}

extension Sequence where Iterator.Element == VodSeasonReferenceModel {
    
    var DTOs: [VodSeasonReference] {
        return map { $0.DTO }
    }
}
