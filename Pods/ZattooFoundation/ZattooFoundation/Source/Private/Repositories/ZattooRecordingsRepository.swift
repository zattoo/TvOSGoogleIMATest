//
//  ZattooRecordingsRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero on 18/08/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


private var networkOperationQueue: OperationQueue = {
    let queue = OperationQueue()
    queue.maxConcurrentOperationCount = 1
    return queue
}()

struct ZattooRecordingsRepository: RecordingsRepository {
    
    private let networkDataSource: RecordingsNetworkDataSource
    private let memoryDataSource: GenericMemoryDataSource<ListOfRecordingsEntity>
    private let refreshDelay: TimeInterval
    
    // MARK: - Initializers
    
    init(networkDataSource: RecordingsNetworkDataSource = ZattooRecordingsNetworkDataSource(),
         memoryDataSource: GenericMemoryDataSource<ListOfRecordingsEntity> = ZattooRecordingsMemoryDataSource.shared,
         refreshDelay: TimeInterval = 15) {
        self.networkDataSource = networkDataSource
        self.memoryDataSource = memoryDataSource
        self.refreshDelay = refreshDelay
    }
    
    // MARK: - RecordingsRepository
    
    func refresh(success: @escaping (ListOfRecordingsModel) -> Void,
                 failure: @escaping (ErrorModel) -> Void) {
        
        removeAll()
        fetch(success: success, failure: failure)
    }
    
    func fetch(success: @escaping (ListOfRecordingsModel) -> Void,
               failure: @escaping (ErrorModel) -> Void) {
        
        networkOperationQueue.addOperation {
            let semaphore = DispatchSemaphore(value: 0)
            
            if let entity = self.memoryDataSource.get() {
                return GlobalMainQueue.async { success(entity.model) }
            }
            
            self.networkDataSource.fetch(
                success: {
                    entity in
                    self.memoryDataSource.save(entity)
                    GlobalMainQueue.async { success(entity.model) }
                    semaphore.signal()
            }, failure: {
                error in
                GlobalMainQueue.async { failure(error.model) }
                semaphore.signal()
            })
            semaphore.wait()
        }
    }
    
    func record(program: ProgramId,
                success: @escaping (RecordingModel) -> Void,
                followUp: @escaping (ListOfRecordingsModel) -> Void,
                failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.record(
            program: program,
            success: {
                entity in
                success(entity.model)
                self.refresh(followUp: followUp)
        }, failure: { failure($0.model) })
    }
    
    func remove(recording: RecordingId,
                success: @escaping () -> Void,
                followUp: @escaping (ListOfRecordingsModel) -> Void,
                failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.remove(
            recording: recording,
            success: {
                success()
                self.refresh(followUp: followUp)
        }, failure: {
            error in
            failure(error.model)
            if error.code == .invalidRecordingId {
                self.refresh(followUp: followUp)
            }
        })
    }
    
    func remove(recordings: [RecordingId],
                success: @escaping () -> Void,
                followUp: @escaping (ListOfRecordingsModel) -> Void,
                failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.remove(
            recordings: recordings,
            success: {
                success()
                self.refresh(followUp: followUp)
        }, failure: {
            error in
            failure(error.model)
            if error.code == .invalidRecordingId {
                self.refresh(followUp: followUp)
            }
        })
    }
    
    func remove(teaserCollectionId: String,
                success: @escaping () -> Void,
                followUp: @escaping (ListOfRecordingsModel) -> Void,
                failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.remove(
            teaserCollectionId: teaserCollectionId,
            success: {
                success()
                self.refresh(followUp: followUp)
        }, failure: { failure($0.model) })
    }
    
    func undelete(recording: RecordingId,
                  success: @escaping (RecordingModel) -> Void,
                  followUp: @escaping (ListOfRecordingsModel) -> Void,
                  failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.undelete(
            recording: recording,
            success: {
                entity in
                success(entity.model)
                self.refresh(followUp: followUp)
        }, failure: { failure($0.model) })
    }
    
    func update(recording: RecordingId,
                lastPosition: Date,
                success: @escaping (RecordingModel) -> Void,
                followUp: @escaping (ListOfRecordingsModel) -> Void,
                failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.update(
            recording: recording,
            lastPosition: lastPosition,
            success: {
                entity in
                success(entity.model)
                self.refresh(followUp: followUp)
        }, failure: { failure($0.model) })
    }
    
    func schedule(program: ProgramId,
                  success: @escaping (RecordingModel, SeriesModel) -> Void,
                  followUp: @escaping (ListOfRecordingsModel) -> Void,
                  warning: @escaping (Int) -> Void,
                  failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.schedule(
            program: program,
            success: {
                recording, series in
                success(recording.model, series.model)
                self.refresh(followUp: followUp, delay: series.isAddingAsync)
        }, failure: {
            error in
            if error.code == NetworkEntityErrorCode.addingLotsOfSeriesRecordingWarning,
                let numberToRecord = error.numberToRecord {
                warning(numberToRecord)
            }
            else {
                failure(error.model)
            }
        })
    }
    
    func forceSchedule(program: ProgramId,
                       success: @escaping (RecordingModel, SeriesModel) -> Void,
                       followUp: @escaping (ListOfRecordingsModel) -> Void,
                       failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.forceSchedule(
            program: program,
            success: {
                recording, series in
                success(recording.model, series.model)
                self.refresh(followUp: followUp, delay: series.isAddingAsync)
        }, failure: { failure($0.model) })
    }
    
    func schedule(series: SeriesId,
                  channel: ChannelId?,
                  success: @escaping (RecordingModel, SeriesModel) -> Void,
                  followUp: @escaping (ListOfRecordingsModel) -> Void,
                  warning: @escaping (Int) -> Void,
                  failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.schedule(
            series: series,
            channel: channel,
            success: {
                recording, series in
                success(recording.model, series.model)
                self.refresh(followUp: followUp, delay: series.isAddingAsync)
        }, failure: {
            error in
            if error.code == NetworkEntityErrorCode.addingLotsOfSeriesRecordingWarning,
                let numberToRecord = error.numberToRecord {
                warning(numberToRecord)
            }
            else {
                failure(error.model)
            }
        })
    }
    
    func forceSchedule(series: SeriesId,
                       channel: ChannelId?,
                       success: @escaping (RecordingModel, SeriesModel) -> Void,
                       followUp: @escaping (ListOfRecordingsModel) -> Void,
                       failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.forceSchedule(
            series: series,
            channel: channel,
            success: {
                recording, series in
                success(recording.model, series.model)
                self.refresh(followUp: followUp, delay: series.isAddingAsync)
        }, failure: { failure($0.model) })
    }
    
    func unschedule(series: SeriesId,
                    channel: ChannelId?,
                    success: @escaping (StoppedSeriesModel) -> Void,
                    followUp: @escaping (ListOfRecordingsModel) -> Void,
                    failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.unschedule(
            series: series,
            channel: channel,
            success: {
                entity in
                success(entity.model)
                self.refresh(followUp: followUp, delay: entity.isDeletingAsync)
        }, failure: {
            error in
            failure(error.model)
            if error.code == .userIsNotCurrentlyRecordingThisTvSeries {
                self.refresh(followUp: followUp)
            }
        })
    }
    
    func removeAll() {
        memoryDataSource.clear()
    }
    
    // MARK: - Private

    private func refresh(followUp: @escaping (ListOfRecordingsModel) -> Void, delay: Bool = false) {
        if delay {
            refreshAfterDelay(followUp: followUp)
        }
        else {
            refresh(success: followUp, failure: { _ in })
        }
    }
    
    private func refreshAfterDelay(followUp: @escaping (ListOfRecordingsModel) -> Void) {
        GlobalMainQueue.asyncAfter(deadline: .now() + refreshDelay) {
            self.refresh(followUp: followUp)
        }
    }
}
