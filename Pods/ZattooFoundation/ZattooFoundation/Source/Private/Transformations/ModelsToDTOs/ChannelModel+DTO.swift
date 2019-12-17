//
//  ChannelModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/15/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension ChannelModel: DTOConvertible {
    
    var DTO: Channel? {
        guard let qualityInfoModel = qualityInfoModels.primaryQualityInfoModel else {
            return nil
        }
        
        let isAvailable = qualityInfoModel.isAvailable
        let qualityInfo = qualityInfoModel.DTO
        
        return Channel(cid: cid,
                       qualityInfo: qualityInfo,
                       isRecordingAvailable: isRecordingAvailable,
                       title: qualityInfo.title,
                       isAvailable: isAvailable)
    }
}

extension Sequence where Iterator.Element == QualityInfoModel {
    
    func sortByPriority() -> [QualityInfoModel] {
        return sorted { $0.availabilityPriority < $1.availabilityPriority}
    }
    
    var primaryQualityInfoModel: QualityInfoModel? {
        return sortByPriority().first
    }
}
