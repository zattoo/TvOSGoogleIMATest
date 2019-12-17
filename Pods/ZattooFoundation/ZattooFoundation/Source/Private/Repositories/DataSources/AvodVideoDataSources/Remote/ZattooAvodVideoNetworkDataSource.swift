//
//  ZattooAvodVideoNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 7/7/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire


struct ZattooAvodVideoNetworkDataSource: AvodVideoNetworkDataSource {
    
    private let manager: SessionManager
    
    init(manager: SessionManager = SessionManager.shared) {
        self.manager = manager
    }
    
    @discardableResult
    func search(_ query: String,
                success: @escaping ([AvodVideoEntity]) -> Void,
                failure: @escaping (NetworkEntityError) -> Void) -> Cancelable? {
        
        let parameters = ["query" : query]
        
        return manager.request(endpoint: .avodSearch, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooAvodVideoSearchResponse>) in
            
            switch result {
            case .success(let searchResult):
                success(searchResult.avodVideos)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }.task
    }

    @discardableResult
    func details(_ token: String,
                 success: @escaping (AvodVideoEntity) -> Void,
                 failure: @escaping (NetworkEntityError) -> Void) -> Cancelable? {

        return manager.request(endpoint: .avodDetails(token: token)).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooAvodVideoDetailsResponse>) in

            switch result {
            case .success(let details):
                success(details.avodVideo)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }.task
    }
}
