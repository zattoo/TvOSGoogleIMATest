//
//  Channel+Parser.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 4/14/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension ChannelEntity {
    
    init(json: JSON) {
        qualityInfoEntities = json["qualities"].transformEachElement(toQualityInfoEntity)
        cid = json["id"].stringValue
        isRecordingAvailable = json["recording"].boolValue
    }
}

// MARK: - Private

private func toQualityInfoEntity(json: JSON) -> QualityInfoEntity? {
    return QualityInfoEntity(json: json)
}
