//
//  ZattooTrackingDataSource.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 13.12.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire


struct ZattooTrackingDataSource: TrackingDataSource {

    private let manager: SessionManager

    init(manager: SessionManager = SessionManager.shared) {
        self.manager = manager
    }

    // MARK: - TrackingDataSource

    func logSTBStats(statsModel: STBStats,
                     success: @escaping () -> Void,
                     failure: @escaping (NetworkEntityError) -> Void) {

        let parameters: Parameters = [
            "system_status": statsModel.systemStatus,
            "network_type": statsModel.networkType,
            "ping_streaming_server": statsModel.pingStreamingServer,
            "app_uptime": statsModel.appUptime,
            "app_version": statsModel.appVersion,
            "release_version": statsModel.releaseVersion,
            "os_version": statsModel.osVersion            
        ]

        manager.request(endpoint: .logSTBStats, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {

            (_, _, result: Result<ZattooResponse>) in

            if result.isSuccess {
                success()
            } else {
                failure(NetworkEntityError(code: .🔥))
            }
        }
    }
}

