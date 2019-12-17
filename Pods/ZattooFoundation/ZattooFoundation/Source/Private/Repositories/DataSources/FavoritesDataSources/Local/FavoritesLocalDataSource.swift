//
//  FavoritesLocalDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/27/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol FavoritesLocalDataSource {
    
    func fetch(_ success: @escaping ([ChannelId]?) -> Void)
    func update(_ cids: [String])
    func removeAll()
}
