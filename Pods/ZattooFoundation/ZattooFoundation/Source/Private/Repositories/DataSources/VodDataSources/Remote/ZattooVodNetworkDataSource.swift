//
//  ZattooVodNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/26/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire


struct ZattooVodNetworkDataSource: VodNetworkDataSource {

    private let manager: SessionManager

    init(manager: SessionManager = .shared) {
        self.manager = manager
    }

    // MARK: - VodNetworkDataSource

    func vodStatuses(success: @escaping (VodStatusCollectionEntity) -> Void,
                     failure: @escaping (NetworkEntityError) -> Void) {

        manager
            .request(endpoint: .vodStatus)
            .responseObject(errorEntity: NetworkEntityError.self) {
                (_, _, result: Result<ZattooVodStatusResponse>) in
                
                switch result {
                case .success(let entity):
                    success(entity.vodStatusCollection)
                case .failure(let errorEntity):
                    guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                    failure(errorEntity)
                }
        }
    }
    
    func order(id: TeasableId,
               teasableType: TeasableTypeEntity,
               token: String,
               success: @escaping (VodStatusEntity) -> Void,
               failure: @escaping (NetworkEntityError) -> Void) {

        let parameters = [
            "teasable_type" : teasableType.rawValue,
            "teasable_id" : id,
            "term_token" : token]

        manager
            .request(endpoint: .vodOrder, parameters: parameters)
            .responseObject(errorEntity: NetworkEntityError.self) {
                (_, _, result: Result<ZattooVodOrderResponse>) in
                
                switch result {
                case .success(let entity):
                    success(entity.statusEntity)
                case .failure(let errorEntity):
                    guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                    failure(errorEntity)
                }
                
        }
    }

    @discardableResult
    func search(pghash: String,
                query: String,
                success: @escaping (VodSearchResultEntity) -> Void,
                failure: @escaping (NetworkEntityError) -> Void) -> Cancelable? {
        
        let parameters = ["query": query]
        
        return manager
            .request(endpoint: .vodSearch(pghash: pghash), parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
                (_, _, result: Result<ZattooVodSearchResponse>) in
                
                switch result {
                case .success(let entity):
                    success(entity.searchResult)
                case .failure(let errorEntity):
                    guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                    failure(errorEntity)
                }
        }.task
    }

    func updateVodStatus(id: TeasableId,
                         teasableType: TeasableTypeEntity,
                         position: TimeInterval?,
                         captionLanguageCode: String?,
                         audioLanguageCode: String?,
                         success: @escaping (VodStatusUpdateResultEntity) -> Void,
                         failure: @escaping (NetworkEntityError) -> Void) {

        var parameters: [String: Any] = [
            "teasable_type" : teasableType.rawValue,
            "teasable_id" : id,
        ]

        if let position = position {
            parameters["position"] = Int(position)
        }

        if let captionLanguageCode = captionLanguageCode {
            parameters["caption_language_code"] = captionLanguageCode
        }

        if let audioLanguageCode = audioLanguageCode {
            parameters["audio_language_code"] = audioLanguageCode
        }

        manager
            .request(endpoint: .vodStatusUpdate, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
                (_, _, result: Result<ZattooVodStatusUpdateResponse>) in

                switch result {
                case .success(let entity):
                    success(entity.vodStatusUpdateResultEntity)
                case .failure(let errorEntity):
                    guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                    failure(errorEntity)
                }
        }
    }

    func vodMovie(id: VodId,
                  success: @escaping (VodMovieEntity) -> Void,
                  failure: @escaping (NetworkEntityError) -> Void) {

        manager
            .request(endpoint: .vodMovie(id: id))
            .responseObject(errorEntity: NetworkEntityError.self) {
                (_, _, result: Result<ZattooVodMovieResponse>) in

                switch result {
                case .success(let entity):
                    success(entity.vodMovie)
                case .failure(let errorEntity):
                    guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                    failure(errorEntity)
                }
        }
    }
    
    func vodSeries(id: VodSeriesId,
                   season: VodId?,
                   success: @escaping (VodSeriesEntity) -> Void,
                   failure: @escaping (NetworkEntityError) -> Void) {
        
        let parameters = (season != nil) ? ["season_id": season!] : [:]
        
        manager
            .request(endpoint: .vodSeries(id: id), parameters: parameters)
            .responseObject(errorEntity: NetworkEntityError.self) {
                (_, _, result: Result<ZattooVodSeriesResponse>) in
                
                switch result {
                case .success(let entity):
                    success(entity.vodSeries)
                case .failure(let errorEntity):
                    guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                    failure(errorEntity)
                }
        }
    }

    func vodSubscriptions(success: @escaping (VodSubscriptionsEntity) -> Void,
                          failure: @escaping (NetworkEntityError) -> Void) {
        manager
            .request(endpoint: .vodSubscriptions)
            .responseObject(errorEntity: NetworkEntityError.self) {
                (_, _, result: Result<ZattooVodSubscriptionsResponse>) in

                switch result {
                case .success(let entity):
                    success(entity.vodSubscriptions)
                case .failure(let errorEntity):
                    guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                    failure(errorEntity)
                }
        }
    }

    func vodWatchList(success: @escaping (VodWatchListEntity) -> Void,
                      failure: @escaping (NetworkEntityError) -> Void) {

        manager
            .request(endpoint: .vodWatchList).responseObject(errorEntity: NetworkEntityError.self) {
                (_, _, result: Result<ZattooVodWatchListResponse>) in

                switch result {
                case .success(let entity):
                    success(entity.vodWatchList)
                case .failure(let errorEntity):
                    guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                    failure(errorEntity)
                }
        }
    }

    func vodWatchListAdd(id: TeasableId,
                         teasableType: TeasableTypeEntity,
                         success: @escaping (VodWatchListEntity) -> Void,
                         failure: @escaping (NetworkEntityError) -> Void) {

        let parameters: [String: Any] = [
            "teasable_type" : teasableType.rawValue,
            "teasable_id" : id,
        ]

        manager
            .request(endpoint: .vodWatchListAdd, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
                (_, _, result: Result<ZattooVodWatchListResponse>) in

                switch result {
                case .success(let entity):
                    success(entity.vodWatchList)
                case .failure(let errorEntity):
                    guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                    failure(errorEntity)
                }
        }
    }

    func vodWatchListRemove(id: TeasableId,
                            teasableType: TeasableTypeEntity,
                            success: @escaping (VodWatchListEntity) -> Void,
                            failure: @escaping (NetworkEntityError) -> Void) {

        let parameters: [String: Any] = [
            "teasable_type" : teasableType.rawValue,
            "teasable_id" : id,
        ]

        manager
            .request(endpoint: .vodWatchListRemove, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
                (_, _, result: Result<ZattooVodWatchListResponse>) in

                switch result {
                case .success(let entity):
                    success(entity.vodWatchList)
                case .failure(let errorEntity):
                    guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                    failure(errorEntity)
                }
        }
    }
}
