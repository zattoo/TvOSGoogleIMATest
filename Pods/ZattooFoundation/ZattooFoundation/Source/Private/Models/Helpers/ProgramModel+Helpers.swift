//
//  ProgramModel+Helpers.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 12/19/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension ProgramModel {

    func with(cid newCid: ChannelId) -> ProgramModel {
        return ProgramModel(
            id: id,
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
            cid: newCid,
            tvSeriesId: tvSeriesId,
            isSeriesRecordingEligible: isSeriesRecordingEligible,
            isRecordingEligible: isRecordingEligible,
            shouldContinueWatching: shouldContinueWatching,
            episodeNumber: episodeNumber,
            seasonNumber: seasonNumber,
            hideUnlessRecording: hideUnlessRecording
        )
    }
}
