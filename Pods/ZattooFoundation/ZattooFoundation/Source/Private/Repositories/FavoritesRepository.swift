//
//  FavoritesRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/17/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol FavoritesRepository {
    
    func fetch(success: @escaping ([ChannelId]) -> Void,
               failure: @escaping (ErrorModel) -> Void)
    
    func refresh(success: @escaping ([ChannelId]) -> Void,
                 failure: @escaping (ErrorModel) -> Void)
    
    func update(cids: [String],
                success: @escaping () -> Void,
                failure: @escaping (ErrorModel) -> Void)
    
    func removeAll()
}
