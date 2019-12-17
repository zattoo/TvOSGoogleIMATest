//
//  ZattooTrackingRepository.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 13.12.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ZattooTrackingRepository: TrackingRepository {

    private let networkDataSource: TrackingDataSource

    // MARK: - Initializers

    init(networkDataSource: TrackingDataSource = ZattooTrackingDataSource()) {
        self.networkDataSource = networkDataSource
    }

    // MARK: - TrackingRepository

    func logSTBStats(statsModel: STBStats,
                     success: @escaping () -> Void,
                     failure: @escaping (ErrorModel) -> Void) {

        networkDataSource.logSTBStats(
            statsModel: statsModel,
            success: { success() },
            failure: { failure($0.model) })
    }
}

