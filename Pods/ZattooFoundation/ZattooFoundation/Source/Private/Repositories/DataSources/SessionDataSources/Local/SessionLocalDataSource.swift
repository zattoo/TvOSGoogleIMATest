//
//  SessionLocalDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


private let archiveName = "SessionUserDefaults"

final class SessionLocalDataSource: GenericLocalDataSource<SessionEntity> {

    static let shared: SessionLocalDataSource = {
        return SessionLocalDataSource(archiveKey: archiveName)
    }()
}
