//
//  ZattooRecordingsUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero on 18/08/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class ZattooRecordingsUseCases: NSObject, RecordingsUseCases {
    
    private let sessionRepository: SessionRepository
    private let recordingsRepository: RecordingsRepository
    
    // MARK: - Initializers
    
    convenience public override init() {
        self.init(sessionRepository: ZattooSessionRepository(),
                  recordingsRepository: ZattooRecordingsRepository())
    }
    
    init(sessionRepository: SessionRepository, recordingsRepository: RecordingsRepository) {
        self.sessionRepository = sessionRepository
        self.recordingsRepository = recordingsRepository
        super.init()
    }
    
    // MARK: - RecordingsUseCases
    
    @objc
    public func recordings(success: @escaping (ListOfRecordings) -> Void,
                           failure: @escaping (Error) -> Void) {
        
        sessionRepository.session(
            success: {
                [weak self] session in

                guard session.isRecordingsEligible else {
                    return failure(Error(code: .recordingRequired))
                }
                
                self?.recordingsRepository.fetch(
                    success: { success($0.DTO) },
                    failure: { failure($0.DTO) })
            },
            failure: { failure ($0.DTO) })
    }

    #if os(iOS)
    @objc
    public func refresh(success: @escaping (ListOfRecordings) -> Void,
                        failure: @escaping (Error) -> Void) {

        sessionRepository.session(
            success: {
                [weak self] session in

                guard session.isRecordingsEligible else {
                    return failure(Error(code: .recordingRequired))
                }

                self?.recordingsRepository.refresh(
                    success: { success($0.DTO) },
                    failure: { failure($0.DTO) })
            },
            failure: { failure ($0.DTO) })
    }
    #endif
    
    @objc
    public func record(program: ProgramId,
                       success: @escaping (Recording) -> Void,
                       followUp: @escaping (ListOfRecordings) -> Void,
                       failure: @escaping (Error) -> Void) {
        
        recordingsRepository.record(program: program,
                                    success: { success($0.DTO) },
                                    followUp: { followUp($0.DTO) },
                                    failure: { failure($0.DTO) })
    }
    
    @objc
    public func remove(recording: RecordingId,
                       success: @escaping () -> Void,
                       followUp: @escaping (ListOfRecordings) -> Void,
                       failure: @escaping (Error) -> Void) {
        
        recordingsRepository.remove(recording: recording,
                                    success: { success() },
                                    followUp: { followUp($0.DTO) },
                                    failure: { failure($0.DTO) })
    }

    @objc
    public func remove(recordings: [RecordingId],
                       success: @escaping () -> Void,
                       followUp: @escaping (ListOfRecordings) -> Void,
                       failure: @escaping (Error) -> Void) {

        recordingsRepository.remove(recordings: recordings,
                                    success: { success() },
                                    followUp: { followUp($0.DTO) },
                                    failure: { failure($0.DTO) })
    }

    @objc
    public func remove(teaserCollectionId: String,
                       success: @escaping () -> Void,
                       followUp: @escaping (ListOfRecordings) -> Void,
                       failure: @escaping (Error) -> Void) {

        recordingsRepository.remove(teaserCollectionId: teaserCollectionId,
                                    success: { success() },
                                    followUp: { followUp($0.DTO) },
                                    failure: { failure($0.DTO) })
    }
    
    @objc
    public func undelete(recording: RecordingId,
                         success: @escaping (Recording) -> Void,
                         followUp: @escaping (ListOfRecordings) -> Void,
                         failure: @escaping (Error) -> Void) {

        recordingsRepository.undelete(recording: recording,
                                      success: { success($0.DTO) },
                                      followUp: { followUp($0.DTO) },
                                      failure: { failure($0.DTO) })
    }
    
    @objc
    public func update(recording: RecordingId,
                       lastPosition: Date,
                       success: @escaping (Recording) -> Void,
                       followUp: @escaping (ListOfRecordings) -> Void,
                       failure: @escaping (Error) -> Void) {
        
        recordingsRepository.update(recording: recording,
                                    lastPosition: lastPosition,
                                    success: { success($0.DTO) },
                                    followUp: { followUp($0.DTO) },
                                    failure: { failure($0.DTO) })
    }
    
    @objc
    public func schedule(program: ProgramId,
                         success: @escaping (Recording, Series) -> Void,
                         followUp: @escaping (ListOfRecordings) -> Void,
                         warning: @escaping (Int) -> Void,
                         failure: @escaping (Error) -> Void) {
        
        recordingsRepository.schedule(program: program,
                                      success: { success($0.DTO, $1.DTO) },
                                      followUp: { followUp($0.DTO) },
                                      warning: { warning($0) },
                                      failure: { failure($0.DTO) })
    }
    
    @objc
    public func forceSchedule(program: ProgramId,
                              success: @escaping (Recording, Series) -> Void,
                              followUp: @escaping (ListOfRecordings) -> Void,
                              failure: @escaping (Error) -> Void) {
        
        recordingsRepository.forceSchedule(program: program,
                                           success: { success($0.DTO, $1.DTO) },
                                           followUp: { followUp($0.DTO) },
                                           failure: { failure($0.DTO) })
    }
    
    @objc
    public func schedule(series recording: SeriesId,
                         channel: ChannelId?,
                         success: @escaping (Recording, Series) -> Void,
                         followUp: @escaping (ListOfRecordings) -> Void,
                         warning: @escaping (Int) -> Void,
                         failure: @escaping (Error) -> Void) {
        
        recordingsRepository.schedule(series: recording,
                                      channel: channel,
                                      success: { success($0.DTO, $1.DTO) },
                                      followUp: { followUp($0.DTO) },
                                      warning: { warning($0) },
                                      failure: { failure($0.DTO) })
    }
    
    @objc
    public func forceSchedule(series recording: SeriesId,
                              channel: ChannelId?,
                              success: @escaping (Recording, Series) -> Void,
                              followUp: @escaping (ListOfRecordings) -> Void,
                              failure: @escaping (Error) -> Void) {
        
        recordingsRepository.forceSchedule(series: recording,
                                           channel: channel,
                                           success: { success($0.DTO, $1.DTO) },
                                           followUp: { followUp($0.DTO) },
                                           failure: { failure($0.DTO) })
    }
    
    @objc
    public func unschedule(series recording: SeriesId,
                           channel: ChannelId?,
                           success: @escaping (StoppedSeries) -> Void,
                           followUp: @escaping (ListOfRecordings) -> Void,
                           failure: @escaping (Error) -> Void) {
        
        recordingsRepository.unschedule(series: recording,
                                        channel: channel,
                                        success: { success($0.DTO) },
                                        followUp: { followUp($0.DTO) },
                                        failure: { failure($0.DTO) })
    }
}
