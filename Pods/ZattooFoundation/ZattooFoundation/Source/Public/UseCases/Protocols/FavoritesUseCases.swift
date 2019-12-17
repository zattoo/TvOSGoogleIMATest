//
//  FavoritesUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/2/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc public protocol FavoritesUseCases {
    
    @objc
    func favorites(success: @escaping ([ChannelId]) -> Void,
                   failure: @escaping (Error) -> Void)
    
    @objc
    func refreshFavorites(success: @escaping ([ChannelId]) -> Void,
                          failure: @escaping (Error) -> Void)
    
    @objc
    func addFavorite(cid: String,
                     success: @escaping ([ChannelId]) -> Void,
                     failure: @escaping (Error) -> Void)
    
    @objc
    func removeFavorite(cid: String,
                        success: @escaping ([ChannelId]) -> Void,
                        failure: @escaping (Error) -> Void)
    
    @objc
    func updateFavorites(cids: [String],
                         success: @escaping ([ChannelId]) -> Void,
                         failure: @escaping (Error) -> Void)
}
