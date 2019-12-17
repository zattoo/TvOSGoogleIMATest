//
//  ChannelEPGModel.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/4/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ChannelEPGModel {
    let cid: ChannelId
    let programs: [ProgramModel]
}

extension ChannelEPGModel {
    
    func fillGapsInPrograms(from start: Date, to end: Date) -> ChannelEPGModel {
        guard var program = programs.first else {
            let placeholder = programToFillGap(from: start, to: end)
            return ChannelEPGModel(cid: cid, programs: [placeholder])
        }
        
        var programsWithoutGaps: [ProgramModel] = []
        if start < program.start {
            let fillProgram = programToFillGap(from: start, to: program.start)
            programsWithoutGaps.append(fillProgram)
        }
        
        programsWithoutGaps.append(program)
        
        for currentProgram in programs[1...] {
            if program.end < currentProgram.start {
                let fillProgram = programToFillGap(from: program.end, to: currentProgram.start)
                programsWithoutGaps.append(fillProgram)
            }
            
            programsWithoutGaps.append(currentProgram)
            program = currentProgram
        }
        
        if program.end < end {
            let fillProgram = programToFillGap(from: program.end, to: end)
            programsWithoutGaps.append(fillProgram)
        }
        
        return ChannelEPGModel(cid: cid, programs: programsWithoutGaps)
    }
    
    // MARK: - Private
    
    private func programToFillGap(from start: Date, to end: Date) -> ProgramModel {
        return ProgramModel(id: -1, title: "", start: start, end: end, episodeTitle: nil, imageToken: nil, isBlackout: false, categories: [], genres: [], selectiveRecallUntil: nil, description: nil, credits: [:], country: nil, year: nil, channelName: nil, cid: "", tvSeriesId: nil, isSeriesRecordingEligible: false, isRecordingEligible: false, shouldContinueWatching: false, episodeNumber: nil, seasonNumber: nil, hideUnlessRecording: false)
    }
}
