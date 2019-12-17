//
//  VodStatusUpdateResultEntity.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/8/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodStatusUpdateResultEntity: Codable {
    let teasableId: TeasableId
    let teasableType: TeasableTypeEntity
    let position: TimeInterval
    let captionLanguageCode: String
    let audioLanguageCode: String
}
