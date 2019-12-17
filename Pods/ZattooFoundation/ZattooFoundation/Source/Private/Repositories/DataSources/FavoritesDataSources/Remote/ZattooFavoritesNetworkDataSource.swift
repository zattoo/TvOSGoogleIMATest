//
//  ZattooFavoritesNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/17/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire


struct ZattooFavoritesNetworkDataSource: FavoritesNetworkDataSource {
    
    private let manager: SessionManager
    
    init(manager: SessionManager = SessionManager.shared) {
        self.manager = manager
    }
    
    // MARK: - FavoritesNetworkDataSource
    
    func fetch(success: @escaping ([ChannelId]) -> Void,
               failure: @escaping (NetworkEntityError) -> Void) {
        
        manager.request(endpoint: .favorites).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooFavoritesResponse>) in
            
            switch result {
            case .success(let favoritesResponse):
                success(favoritesResponse.channelIds)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    func update(cids: [String],
                success: @escaping () -> Void,
                failure: @escaping (NetworkEntityError) -> Void) {
        
        let parameters = ["cids" : cids.joined(separator: ",")]

        manager.request(endpoint: .updateFavorites, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            
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
}
