//
//  VodStatusUpdateResultEntity+Model.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/9/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodStatusUpdateResultEntity: ModelConvertible {

    var model: VodStatusUpdateResultModel {
        return VodStatusUpdateResultModel(
            teasableId: teasableId,
            teasableType: teasableType.model,
            position: position,
            captionLanguageCode: captionLanguageCode,
            audioLanguageCode: audioLanguageCode
        )
    }
}
