//
//  ProgramModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/29/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension ProgramModel: DTOConvertible {
    
    var DTO: Program {
        return Program(id: id, title: title, start: start, end: end, episodeTitle: episodeTitle, imageToken: imageToken, isBlackout: isBlackout, categories: categories, genres: genres, selectiveRecallUntil: selectiveRecallUntil, programDescription: description, credits: credits, country: country, year: year, channelName: channelName, cid: cid, tvSeriesId: tvSeriesId, isSeriesRecordingEligible: isSeriesRecordingEligible, isRecordingEligible: isRecordingEligible, shouldContinueWatching: shouldContinueWatching, episodeNumber: episodeNumber, seasonNumber: seasonNumber, hideUnlessRecording: hideUnlessRecording)
    }
}

extension Sequence where Iterator.Element == ProgramModel {
    
    var DTOs: [Program] {
        return map { $0.DTO }
    }
}
