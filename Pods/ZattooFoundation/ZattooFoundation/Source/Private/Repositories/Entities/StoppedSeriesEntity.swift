//
//  StoppedSeriesEntity.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 1/19/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


struct StoppedSeriesEntity: Codable {
    
    let numberOfFutureRecordingsDeleted: Int
    let isDeletingAsync: Bool
}
