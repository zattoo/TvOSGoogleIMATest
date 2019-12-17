//
//  Program.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/29/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


public typealias ProgramId = NSNumber
public typealias Credits = [String: [String]]

@objc(ZattooFoundationProgram)
final public class Program: NSObject, Teasable {
    public let id: ProgramId?
    public let title: String
    public let start: Date
    public let end: Date
    public let episodeTitle: String?
    public let imageToken: String?
    public let isBlackout: Bool
    public let categories: [String]
    public let genres: [String]
    public let selectiveRecallUntil: Date?
    public let programDescription: String?
    public let credits: Credits
    public let country: String?
    public let year: String?
    public let channelName: String?
    public let cid: ChannelId
    public let tvSeriesId: SeriesId?
    public let isSeriesRecordingEligible: Bool
    public let isRecordingEligible: Bool
    public let shouldContinueWatching: Bool?
    public let episodeNumber: Int?
    public let seasonNumber: Int?
    public let hideUnlessRecording: Bool

    init(id: ProgramId?, title: String, start: Date, end: Date, episodeTitle: String?, imageToken: String?, isBlackout: Bool, categories: [String], genres: [String], selectiveRecallUntil: Date?, programDescription: String?, credits: Credits, country: String?, year: String?, channelName: String?, cid: ChannelId, tvSeriesId: SeriesId?, isSeriesRecordingEligible: Bool, isRecordingEligible: Bool, shouldContinueWatching: Bool?, episodeNumber: Int?, seasonNumber: Int?, hideUnlessRecording: Bool) {
        self.id = id
        self.title = title
        self.start = start
        self.end = end
        self.episodeTitle = episodeTitle
        self.imageToken = imageToken
        self.isBlackout = isBlackout
        self.categories = categories
        self.genres = genres
        self.selectiveRecallUntil = selectiveRecallUntil
        self.programDescription = programDescription
        self.credits = credits
        self.country = country
        self.year = year
        self.channelName = channelName
        self.cid = cid
        self.tvSeriesId = tvSeriesId
        self.isSeriesRecordingEligible = isSeriesRecordingEligible
        self.isRecordingEligible = isRecordingEligible
        self.shouldContinueWatching = shouldContinueWatching
        self.episodeNumber = episodeNumber
        self.seasonNumber = seasonNumber
        self.hideUnlessRecording = hideUnlessRecording
    }
}
