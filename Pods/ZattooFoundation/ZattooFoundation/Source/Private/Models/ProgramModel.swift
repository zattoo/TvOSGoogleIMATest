//
//  ProgramModel.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/29/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ProgramModel {
    let id: ProgramId?
    let title: String
    let start: Date
    let end: Date
    let episodeTitle: String?
    let imageToken: String?
    let isBlackout: Bool
    let categories: [String]
    let genres: [String]
    let selectiveRecallUntil: Date?
    let description: String?
    let credits: Credits
    let country: String?
    let year: String?
    let channelName: String?
    let cid: ChannelId
    let tvSeriesId: SeriesId?
    let isSeriesRecordingEligible: Bool
    let isRecordingEligible: Bool
    let shouldContinueWatching: Bool?
    let episodeNumber: Int?
    let seasonNumber: Int?
    let hideUnlessRecording: Bool
}
