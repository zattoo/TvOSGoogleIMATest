//
//  RecordingEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 18/08/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension RecordingEntity: ModelConvertible {
    
    var model: RecordingModel {
        return RecordingModel(id: NSNumber(value: id),
                              cid: cid,
                              title: title,
                              episodeTitle: episodeTitle,
                              start: start,
                              end: end,
                              programId: NSNumber(value: programId),
                              lastPosition: lastPosition,
                              isPartial: isPartial,
                              imageToken: imageToken,
                              isSeriesRecordingEligible: isSeriesRecordingEligible,
                              tvSeriesId: tvSeriesId == nil ? nil : NSNumber(value: tvSeriesId!),
                              qualityLevel: qualityLevel.model,
                              isRestrictedQuality: isRestrictedQuality,
                              expiration: expiration,
                              isRecordedAsSeries: false)
    }
}
