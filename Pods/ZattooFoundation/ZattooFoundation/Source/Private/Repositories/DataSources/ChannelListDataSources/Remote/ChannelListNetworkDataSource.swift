//
//  ChannelListNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/22/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol ChannelListNetworkDataSource {
    
    func channelList(pghash: String,
                     success: @escaping ([ChannelGroupEntity]) -> Void,
                     failure: @escaping (NetworkEntityError) -> Void)
}
