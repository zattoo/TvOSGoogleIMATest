//
//  ZattooFavoritesUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/2/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class ZattooFavoritesUseCases: NSObject, FavoritesUseCases {
    
    private let favoritesRepository: FavoritesRepository
    
    // MARK: - Initializers
    
    convenience public override init() {
        self.init(favoritesRepository: ZattooFavoritesRepository())
    }
    
    init(favoritesRepository: FavoritesRepository) {
        self.favoritesRepository = favoritesRepository
        super.init()
    }
    
    // MARK: - Public
    
    @objc
    public func refreshFavorites(success: @escaping ([ChannelId]) -> Void,
                                 failure: @escaping (Error) -> Void) {
        
        favoritesRepository.refresh(
            success: success,
            failure: { failure($0.DTO) })
    }
    
    @objc
    public func favorites(success: @escaping ([ChannelId]) -> Void,
                          failure: @escaping (Error) -> Void) {
        
        favoritesRepository.fetch(
            success: success,
            failure: { failure($0.DTO) })
    }
    
    @objc
    public func addFavorite(cid: String,
                            success: @escaping ([ChannelId]) -> Void,
                            failure: @escaping (Error) -> Void) {
        
        favorites(
            success: {
                [weak self] favorites in
                self?.updateFavorites(cids: favorites + [cid], success: success, failure: failure)
            },
            failure: failure)
    }
    
    @objc
    public func removeFavorite(cid: String,
                               success: @escaping ([ChannelId]) -> Void,
                               failure: @escaping (Error) -> Void) {
        
        favorites(success: {
            [weak self] favorites in
                self?.updateFavorites(cids: favorites.filter {$0 != cid }, success: success, failure: failure)
            },
            failure: failure)
    }
    
    @objc
    public func updateFavorites(cids: [String],
                                success: @escaping ([ChannelId]) -> Void,
                                failure: @escaping (Error) -> Void) {
        
        favoritesRepository.update(cids: cids,
                                   success: { success(cids) },
                                   failure: { failure($0.DTO) })
    }
}
