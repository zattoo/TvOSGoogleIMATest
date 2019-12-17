//
//  VodSeasonReferenceEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 30.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodSeasonReferenceEntity: ModelConvertible {
    
    var model: VodSeasonReferenceModel {
        return VodSeasonReferenceModel(
            id: id,
            number: number)
    }
}

extension Sequence where Iterator.Element == VodSeasonReferenceEntity {
    
    var models: [VodSeasonReferenceModel] {
        return map { $0.model }
    }
}
