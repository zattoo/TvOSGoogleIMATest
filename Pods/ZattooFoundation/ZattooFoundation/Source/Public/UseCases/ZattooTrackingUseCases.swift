//
//  ZattooTrackingUseCases.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 13.12.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class ZattooTrackingUseCases: NSObject, TrackingUseCases {

    private let trackingRepository: TrackingRepository

    convenience public override init() {
        self.init(trackingRepository: ZattooTrackingRepository())
    }

    init(trackingRepository: TrackingRepository) {
        self.trackingRepository = trackingRepository
    }

    // MARK: - TrackingUseCases

    public func logSTBStats(statsModel: STBStats,
                            success: @escaping () -> Void,
                            failure: @escaping (Error) -> Void) {

        trackingRepository.logSTBStats(statsModel: statsModel,
                                       success: { success() },
                                       failure: { failure($0.DTO) })
    }
}
