//
//  ZattooRecordingsNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero on 18/08/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire
import SwiftDate


struct ZattooRecordingsNetworkDataSource: RecordingsNetworkDataSource {
    
    private let manager: SessionManager

    private static let rateLimiter = RateLimiter(tokensPerInterval: 2, interval: .second)

    init(manager: SessionManager = SessionManager.shared) {
        self.manager = manager
    }
    
    // MARK: - RecordingsNetworkDataSource
    
    func fetch(success: @escaping (ListOfRecordingsEntity) -> Void,
               failure: @escaping (NetworkEntityError) -> Void) {

        ZattooRecordingsNetworkDataSource.rateLimiter.removeTokens(1) {
            _ in
            self.manager.request(endpoint: .recordings).responseObject(errorEntity: NetworkEntityError.self) {
                (_, _, result: Result<ZattooRecordingsResponse>) in

                switch result {
                case .success(let recordingsResponse):
                    success(recordingsResponse.listOfRecordings)
                case .failure(let errorEntity):
                    guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                    failure(errorEntity)
                }
            }
        }
    }
    
    func record(program: ProgramId,
                success: @escaping (RecordingEntity) -> Void,
                failure: @escaping (NetworkEntityError) -> Void) {
        
        let parameters = ["program_id" : program]
        manager.request(endpoint: .recordProgram, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooSingleRecordingResponse>) in
            switch result {
            case .success(let recordingResponse):
                success(recordingResponse.recording)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    func remove(recording: RecordingId,
                success: @escaping () -> Void,
                failure: @escaping (NetworkEntityError) -> Void) {
        
        let parameters = ["recording_id" : recording]
        manager.request(endpoint: .removeRecording, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooResponse>) in
            switch result {
            case .success:
                success()
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }

    func remove(recordings: [RecordingId],
                success: @escaping () -> Void,
                failure: @escaping (NetworkEntityError) -> Void) {

        let parameters = ["recording_ids" : recordings.map({ $0.stringValue }).joined(separator: ",")]

        manager.request(endpoint: .removeBatchRecording, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooResponse>) in
            switch result {
            case .success:
                success()
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }

    func remove(teaserCollectionId: String,
                success: @escaping () -> Void,
                failure: @escaping (NetworkEntityError) -> Void) {

        let parameters: Parameters = ["recording_ids" : [],
                                      "teaser_collection_public_id" : teaserCollectionId,
                                      "force" : "True"]

        manager.request(endpoint: .removeBatchRecording, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooResponse>) in
            switch result {
            case .success:
                success()
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    func undelete(recording: RecordingId,
                  success: @escaping (RecordingEntity) -> Void,
                  failure: @escaping (NetworkEntityError) -> Void) {
        
        let parameters = ["recording_id" : recording]
        manager.request(endpoint: .undeleteRecording, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooSingleRecordingResponse>) in
            switch result {
            case .success(let recordingResponse):
                success(recordingResponse.recording)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    func update(recording: RecordingId,
                lastPosition: Date,
                success: @escaping (RecordingEntity) -> Void,
                failure: @escaping (NetworkEntityError) -> Void) {
        
        let parameters: [String: Any] = [
            "recording_id" : recording,
            "position" : lastPosition.ISO8601String()
        ]
        
        manager.request(endpoint: .updateRecording, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooSingleRecordingResponse>) in
            
            switch result {
            case .success(let recordingResponse):
                success(recordingResponse.recording)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    func schedule(program: ProgramId,
                  success: @escaping (RecordingEntity, SeriesEntity) -> Void,
                  failure: @escaping (RecordingNetworkEntityError) -> Void) {
        
        let parameters: [String: Any] = [
            "program_id" : program,
            "series" : "True"
        ]
        
        scheduleProgram(with: parameters, success: success, failure: failure)
    }
    
    func forceSchedule(program: ProgramId,
                       success: @escaping (RecordingEntity, SeriesEntity) -> Void,
                       failure: @escaping (NetworkEntityError) -> Void) {
        
        let parameters: [String: Any] = [
            "program_id" : program,
            "series" : "True",
            "series_force" : "True"
        ]
        
        scheduleProgram(with: parameters, success: success, failure: failure)
    }
    
    func schedule(series: SeriesId,
                  channel: ChannelId?,
                  success: @escaping (RecordingEntity, SeriesEntity) -> Void,
                  failure: @escaping (RecordingNetworkEntityError) -> Void) {
        
        var parameters: [String: Any] = ["tv_series_id" : series]
        
        if let channel = channel {
            parameters["cid"] = channel
        }
        
        scheduleSeries(with: parameters, success: success, failure: failure)
    }
    
    func forceSchedule(series: SeriesId,
                       channel: ChannelId?,
                       success: @escaping (RecordingEntity, SeriesEntity) -> Void,
                       failure: @escaping (RecordingNetworkEntityError) -> Void) {
        
        var parameters: [String: Any] = ["tv_series_id" : series]
        parameters["series_force"] = "True"
        if let channel = channel {
            parameters["cid"] = channel
        }
        
        scheduleSeries(with: parameters, success: success, failure: failure)
    }
    
    func unschedule(series: SeriesId,
                    channel: ChannelId?,
                    success: @escaping (StoppedSeriesEntity) -> Void,
                    failure: @escaping (NetworkEntityError) -> Void) {
        
        var parameters: [String: Any] = ["tv_series_id" : series]
        
        if let channel = channel {
            parameters["cid"] = channel
        }
        
        manager.request(endpoint: .stopSeriesRecording, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooStopSeriesResponse>) in
            
            switch result {
            case .success(let stopSeriesResponse):
                success(stopSeriesResponse.stoppedSeriesEntity)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    // MARK: - Private
    
    private func scheduleProgram(with parameters: [String: Any],
                                 success: @escaping (RecordingEntity, SeriesEntity) -> Void,
                                 failure: @escaping (RecordingNetworkEntityError) -> Void) {
        
        manager.request(endpoint: .recordProgram, parameters: parameters).responseObject(errorEntity: RecordingNetworkEntityError.self) {
            (_, _, result: Result<ZattooSeriesResponse>) in
            
            switch result {
            case .success(let seriesResponse):
                success(seriesResponse.recording, seriesResponse.series)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? RecordingNetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    private func scheduleSeries(with parameters: [String: Any],
                                success: @escaping (RecordingEntity, SeriesEntity) -> Void,
                                failure: @escaping (RecordingNetworkEntityError) -> Void) {
        manager.request(endpoint: .startSeriesRecording, parameters: parameters).responseObject(errorEntity: RecordingNetworkEntityError.self) {
            (_, _, result: Result<ZattooSeriesResponse>) in
            
            switch result {
            case .success(let seriesResponse):
                success(seriesResponse.recording, seriesResponse.series)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? RecordingNetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
}
