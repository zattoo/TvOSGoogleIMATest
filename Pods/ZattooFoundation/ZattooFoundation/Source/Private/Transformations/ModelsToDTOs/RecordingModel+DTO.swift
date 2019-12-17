//
//  RecordingModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 18/08/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension RecordingModel: DTOConvertible {
    
    var DTO: Recording {
        return Recording(id: id,
                         cid: cid,
                         title: title,
                         episodeTitle: episodeTitle,
                         start: start,
                         end: end,
                         programId: programId,
                         lastPosition: lastPosition,
                         isPartial: isPartial,
                         imageToken: imageToken,
                         isSeriesRecordingEligible: isSeriesRecordingEligible,
                         tvSeriesId: tvSeriesId, 
                         qualityLevel: qualityLevel.DTO, 
                         isRestrictedQuality: isRestrictedQuality,
                         expiration: expiration,
                         isRecordedAsSeries: isRecordedAsSeries)
    }
}
