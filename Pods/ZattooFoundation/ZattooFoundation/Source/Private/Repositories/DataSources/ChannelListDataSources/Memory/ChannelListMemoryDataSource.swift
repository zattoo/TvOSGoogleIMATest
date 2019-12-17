//
//  ChannelListMemoryDataSource.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 9/27/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


final class ChannelListMemoryDataSource: GenericMemoryDataSource<[ChannelGroupEntity]> {

    static let shared: ChannelListMemoryDataSource = {
        return ChannelListMemoryDataSource()
    }()
}
