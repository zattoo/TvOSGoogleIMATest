//
//  ZattooEPGNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/28/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire
import SwiftDate


struct ZattooEPGNetworkDataSource: EPGNetworkDataSource {
    
    private let manager: SessionManager
    
    init(manager: SessionManager = SessionManager.shared) {
        self.manager = manager
    }
    
    func fetch(pghash: String,
               channels: [ChannelId],
               start: Date,
               end: Date,
               success: @escaping ([ChannelEPGEntity]) -> Void,
               failure: @escaping (NetworkEntityError) -> Void) {

        var normalizedEnd = end

        if start > end {
            normalizedEnd = start + 1.days
        }

        let parameters: [String: Any] = ["cids"   : channels.joined(separator: ","),
                                          "start"  : Int(start.timeIntervalSince1970),
                                          "end"    : Int(normalizedEnd.timeIntervalSince1970)]

        manager.request(endpoint: .epg(pghash: pghash), parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooPowerGuideResponse>) in
           
            switch result {
            case .success(let powerGuideResponse):
                success(powerGuideResponse.epg)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    func details(forPrograms programs: [ProgramId],
                             pghash: String,
                             success: @escaping ([ProgramEntity]) -> Void,
                             failure: @escaping (NetworkEntityError) -> Void) {
        
        let parameters = ["program_ids": programs.map { String(describing: $0) }.joined(separator: ",")]
        manager.request(endpoint: .epgDetails(pghash: pghash), parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooPowerDetailsResponse>) in
            
            switch result {
            case .success(let powerDetailsResponse):
                success(powerDetailsResponse.programs)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }

    func seriesDetails(forSeriesId seriesId: SeriesId,
                       channelId: ChannelId,
                       seasonSpec: SeasonSpec,
                       sorting: String?,
                       isRecordingsOnly: Bool,
                       success: @escaping (SeriesDetailsEntity) -> Void,
                       failure: @escaping (NetworkEntityError) -> Void) {

        var parameters: [String: Any] = [
            "cid": channelId,
            "tv_series_id": seriesId
        ]

        switch seasonSpec {
        case .allSeasons:
            parameters["all_seasons"] = "True"
        case .currentSeason:
            break
        case .season(let seasonNumber):
            parameters["season_number"] = seasonNumber
        }

        if let sorting = sorting {
            parameters["sorting"] = sorting
        }

        if isRecordingsOnly {
            parameters["recordings_only"] = "True"
        }

        manager.request(endpoint: .epgSeriesDetails, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooSeriesDetailsResponse>) in

            switch result {
            case .success(let seriesDetailsResponse):
                success(seriesDetailsResponse.series)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
}
