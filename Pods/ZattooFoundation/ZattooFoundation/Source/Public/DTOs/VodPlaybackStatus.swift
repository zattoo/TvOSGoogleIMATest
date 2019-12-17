//
//  VodPlaybackStatus.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 8/23/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


public struct VodPlaybackStatus: Equatable {
    public let lastPosition: TimeInterval
    public let vodType: VodType?
}
