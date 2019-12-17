//
//  VodPlaybackStatus+Helpers.swift
//  ZattooFoundation
//
//  Created by David Cordero on 26.09.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


private let minimumLenghtForCredits = 3.minutes.timeInterval
private let progressWhereVodIsProbablyShowingCredits = 0.95

public extension VodPlaybackStatus {
    
    func startPosition(for vod: Vod) -> TimeInterval {
        if let duration = vod.duration,
            (duration - lastPosition > minimumLenghtForCredits),
            (lastPosition / duration < progressWhereVodIsProbablyShowingCredits) {
            return lastPosition
        }
        
        return 0
    }
}
