//
//  ZattooFavoritesUserDefaultsDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/27/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


private let favoritesArchiveName = "FavoritesUserDefaultsEntity"
private let queue = DispatchQueue(label: "\(favoritesArchiveName).queue", qos: .userInitiated, attributes: .concurrent)

struct ZattooFavoritesUserDefaultsDataSource: FavoritesLocalDataSource {
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    // MARK: - FavoritesLocalDataSource
    
    func fetch(_ success: @escaping ([ChannelId]?) -> Void) {
        queue.async {
            let favorites = self.userDefaults.array(forKey: favoritesArchiveName) as? [String]
            
            GlobalMainQueue.async {
                success(favorites)
            }
        }
    }
    
    func update(_ cids: [String]) {
        queue.async(flags: .barrier) {
            self.userDefaults.set(cids, forKey: favoritesArchiveName)
        }
    }
    
    func removeAll() {
        queue.async(flags: .barrier) {
            self.userDefaults.set(nil, forKey: favoritesArchiveName)
        }
    }
}
