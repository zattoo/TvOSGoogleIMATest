//
//  ChannelListRepository.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/22/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol ChannelListRepository {
    
    func fetch(pghash: String,
               success: @escaping ([ChannelGroupModel]) -> Void,
               failure: @escaping (ErrorModel) -> Void)
    
    func refresh(pghash: String,
                 success: @escaping ([ChannelGroupModel]) -> Void,
                 failure: @escaping (ErrorModel) -> Void)
    
    func removeAll()
}
