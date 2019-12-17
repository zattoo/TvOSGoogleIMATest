//
//  Session+Helpers.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/4/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftDate


public extension Session {

    enum OnDemandType {
        case avod(pageId: String)
        case vod(pageId: String)
    }
    
    var isHiQ: Bool {
        return account?.isHiQ ?? false
    }
    
    var restrictedUsageLimit: Int? {
        return account?.restrictedUsageLimit
    }
    
    var restrictedUsageSoFar: Int? {
        return account?.restrictedUsageSoFar
    }
    
    var restrictedUsageResetDate: Date? {
        return account?.restrictedUsageResetDate
    }
    
    var isHighlightsPageEnabled: Bool {
        return !(startPagePublicId?.isEmpty ?? true)
    }

    var onDemand: OnDemandType? {
        guard let pageId = onDemandPagePublicId, !pageId.isEmpty else { return nil }
        if isVodEligible {
            return .vod(pageId: pageId)
        }
        else {
            return .avod(pageId: pageId)
        }
    }
    
    var isWhitespaceEnabled: Bool {
        return shopUrl != nil
    }
    
    func isRecordingsEnabled(for channel: Channel, program: Program) -> Bool {
        guard program.id != nil else { return false }

        let isRecordingsEligible = isRecordingsEnabled(for: channel)
        
        if !program.isRecordingEligible {
            return false
        }
        
        if program.isEnded {
            return isRecordingsEligible && isRecallEnabled(for: channel, with: program)
        }
        
        return isRecordingsEligible
    }
    
    func isRecallEnabled(for channel: Channel, with program: Program) -> Bool {
        guard program.id != nil else { return false }
        return isSwissRecallEnabled(for: channel, with: program) || isGermanRecallEnabled(program: program)
    }

    @objc(isSeriesRecordingEnabledForProgram:)
    func isSeriesRecordingEnabled(for program: Program) -> Bool {
        return isSeriesRecordingEligible && program.isSeriesRecordingEligible && program.tvSeriesId != nil
    }

    @objc(isSeriesRecordingEnabledForRecording:)
    func isSeriesRecordingEnabled(for recording: Recording) -> Bool {
        return isSeriesRecordingEligible && recording.isSeriesRecordingEligible && recording.tvSeriesId != nil
    }
    
    // MARK: - Private
    
    private func isRecordingsEnabled(for channel: Channel) -> Bool {
        return isRecordingsEligible && channel.isRecordingAvailable
    }
    
    private func isSwissRecallEnabled(for channel: Channel, with program: Program) -> Bool {
        return isRecallEligible &&
            channel.isRecordingAvailable &&
            didProgramStartWithInRecallWindow(program: program) &&
            didProgramStartAfterRecallStartTime(program: program) &&
            program.start <= Date()
    }
    
    private func isGermanRecallEnabled(program: Program) -> Bool {
        let now = Date()
        guard isSelectiveRecallEligible, let date = program.selectiveRecallUntil,
            now < date && program.start < now else {
            return false
        }
        return true
    }
    
    private func didProgramStartWithInRecallWindow(program: Program) -> Bool {
        return program.start >= Date() - recallSeconds.seconds
    }
    
    private func didProgramStartAfterRecallStartTime(program: Program) -> Bool {
        guard let recallStartTime = recallStartTime else { return false }
        return program.start >= recallStartTime
    }
}
