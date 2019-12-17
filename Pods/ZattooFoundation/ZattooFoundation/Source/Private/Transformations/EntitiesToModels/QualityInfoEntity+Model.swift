//
//  QualityInfoEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 4/20/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension QualityInfoEntity: ModelConvertible {
    
    var model: QualityInfoModel {
        return QualityInfoModel(availabilityModel: availabilityEntity.model,
                                logoToken: logoToken,
                                title: title,
                                streamTypes: streamTypes,
                                drmRequired: drmRequired,
                                qualityLevelModel: qualityLevelEntity.model)
    }
}

extension Sequence where Iterator.Element == QualityInfoEntity {
    
    func toModels() -> [QualityInfoModel] {
        return map { $0.model }
    }
}
