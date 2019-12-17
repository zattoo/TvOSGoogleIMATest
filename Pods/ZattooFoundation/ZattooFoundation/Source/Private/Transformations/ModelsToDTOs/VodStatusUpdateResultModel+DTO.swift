//
//  VodStatusUpdateResultModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/9/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodStatusUpdateResultModel: DTOConvertible {

    var DTO: VodStatusUpdateResult {
        return VodStatusUpdateResult(
            teasableId: teasableId,
            teasableType: teasableType.DTO,
            position: position,
            captionLanguageCode: captionLanguageCode,
            audioLanguageCode: audioLanguageCode
        )
    }
}
