//
//  TrackingDataSource.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 13.12.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol TrackingDataSource {

    func logSTBStats(statsModel: STBStats,
                     success: @escaping () -> Void,
                     failure: @escaping (NetworkEntityError) -> Void)
}

