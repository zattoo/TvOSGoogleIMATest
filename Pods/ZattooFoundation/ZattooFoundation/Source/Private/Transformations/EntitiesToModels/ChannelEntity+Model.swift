//
//  ChannelEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 4/20/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension ChannelEntity: ModelConvertible {
    
    var model: ChannelModel {
        return ChannelModel(cid: cid,
                            qualityInfoModels: qualityInfoEntities.toModels(),
                            isRecordingAvailable: isRecordingAvailable)
    }
}

extension Sequence where Iterator.Element == ChannelEntity {
    
    var models: [ChannelModel] {
        return map { $0.model }
    }
}
