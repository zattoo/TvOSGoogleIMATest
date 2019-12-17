//
//  Channel+Helpers.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 9/13/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


public typealias ChannelsDictionary = [ChannelId: Channel]

extension Sequence where Iterator.Element == Channel {

    public var dictionary: ChannelsDictionary {
        var dictionary = ChannelsDictionary()

        for channel in self {
            dictionary[channel.cid] = channel
        }

        return dictionary
    }
    
    public var availableChannels: [Channel] {
        return filter { $0.isAvailable }
    }
    
    public func filter(withId cid: String) -> Channel? {
        return lazy.filter { $0.cid == cid }.first
    }
}
