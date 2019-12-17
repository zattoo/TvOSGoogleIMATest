//
//  GenericLocalDataSource.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 9/27/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


private let archiveName = "ChannelListUserDefaults"

final class ChannelListLocalDataSource: GenericLocalDataSource<[ChannelGroupEntity]> {

    static let shared: ChannelListLocalDataSource = {
        return ChannelListLocalDataSource(archiveKey: archiveName)
    }()
}
