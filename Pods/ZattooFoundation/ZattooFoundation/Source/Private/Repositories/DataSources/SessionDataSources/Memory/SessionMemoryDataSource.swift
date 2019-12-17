//
//  SessionMemoryDataSource.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 9/30/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


final class SessionMemoryDataSource: GenericMemoryDataSource<SessionEntity> {

    static let shared: SessionMemoryDataSource = {
        return SessionMemoryDataSource()
    }()
}

