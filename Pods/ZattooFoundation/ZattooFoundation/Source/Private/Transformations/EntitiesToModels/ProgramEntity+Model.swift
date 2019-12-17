//
//  ProgramEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/29/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension ProgramEntity: ModelConvertible {
    
    var model: ProgramModel {
        return ProgramModel(id: NSNumber(value: id),
                            title: title,
                            start: start,
                            end: end,
                            episodeTitle: episodeTitle,
                            imageToken: imageToken,
                            isBlackout: isBlackout,
                            categories: categories,
                            genres: genres,
                            selectiveRecallUntil: selectiveRecallUntil,
                            description: description,
                            credits: credits,
                            country: country,
                            year: year,
                            channelName: channelName,
                            cid: cid ?? "",
                            tvSeriesId: tvSeriesId != nil ? NSNumber(value: tvSeriesId!) : nil,
                            isSeriesRecordingEligible: isSeriesRecordingEligible,
                            isRecordingEligible: isRecordingEligible,
                            shouldContinueWatching: shouldContinueWatching,
                            episodeNumber: episodeNumber,
                            seasonNumber: seasonNumber,
                            hideUnlessRecording: hideUnlessRecording)
    }
}

extension Sequence where Iterator.Element == ProgramEntity {
    
    var models: [ProgramModel] {
        return map { $0.model }
    }
}
