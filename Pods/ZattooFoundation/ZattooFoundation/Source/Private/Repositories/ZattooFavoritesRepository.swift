//
//  ZattooFavoritesRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/17/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ZattooFavoritesRepository: FavoritesRepository {
    private let localDataSource: FavoritesLocalDataSource
    private let networkDataSource: FavoritesNetworkDataSource
    
    // MARK: - Initializers
    
    init(localDataSource: FavoritesLocalDataSource = ZattooFavoritesUserDefaultsDataSource(),
         networkDataSource: FavoritesNetworkDataSource = ZattooFavoritesNetworkDataSource()) {
        self.localDataSource = localDataSource
        self.networkDataSource = networkDataSource
    }
    
    // MARK: - FavoritesRepository
    
    func fetch(success: @escaping ([ChannelId]) -> Void,
               failure: @escaping (ErrorModel) -> Void) {
        
        
        localDataSource.fetch {
            localFavorites in
            
            if let localFavorites = localFavorites {
                success(localFavorites)
            }
            else {
                self.remoteFavorites(success: success, failure: failure)
            }
        }
    }
    
    func refresh(success: @escaping ([ChannelId]) -> Void,
                 failure: @escaping (ErrorModel) -> Void) {
        
        remoteFavorites(success: success, failure: failure)
    }
    
    func update(cids: [String],
                success: @escaping () -> Void,
                failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.update(
            cids: cids,
            success: {
                self.localDataSource.update(cids)
                success()
        },
            failure: { failure($0.model) })
    }
    
    func removeAll() {
        localDataSource.removeAll()
    }
    
    // MARK: - Private
    
    private func remoteFavorites(success: @escaping ([String]) -> Void,
                                 failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.fetch(
            success: {
                favorites in
                self.localDataSource.update(favorites)
                success(favorites)
        },
            failure: { failure($0.model) })
    }
}
