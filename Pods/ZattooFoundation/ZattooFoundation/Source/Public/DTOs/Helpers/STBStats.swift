//
//  STBStats.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 13.12.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


public struct STBStats {
    
    let systemStatus: String
    let networkType: String
    let pingStreamingServer: String
    let appUptime: Float
    let appVersion: String
    let releaseVersion: String
    let osVersion: String

    public init(systemStatus: String,
                networkType: String,
                pingStreamingServer: String,
                appUptime: Float,
                appVersion: String,
                releaseVersion: String,
                osVersion: String) {
        
        self.systemStatus = systemStatus
        self.networkType = networkType
        self.pingStreamingServer = pingStreamingServer
        self.appUptime = appUptime
        self.appVersion = appVersion
        self.releaseVersion = releaseVersion
        self.osVersion = osVersion
    }
}

