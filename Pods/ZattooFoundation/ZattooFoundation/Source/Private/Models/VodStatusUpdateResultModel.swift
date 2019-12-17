//
//  VodStatusUpdateResultModel.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/9/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodStatusUpdateResultModel {
    let teasableId: TeasableId
    let teasableType: TeasableTypeModel
    let position: TimeInterval
    let captionLanguageCode: String
    let audioLanguageCode: String
}
