//
//  RemoteFavoritesDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/17/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol FavoritesNetworkDataSource {
    
    func fetch(success: @escaping ([ChannelId]) -> Void,
               failure: @escaping (NetworkEntityError) -> Void)
    
    func update(cids: [String],
                success: @escaping () -> Void,
                failure: @escaping (NetworkEntityError) -> Void)
}
