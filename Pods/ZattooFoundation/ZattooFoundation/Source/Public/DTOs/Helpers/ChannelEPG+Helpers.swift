//
//  ChannelEPG+Helpers.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/7/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


public extension ChannelEPG {
    var now: Program? {
        let now = Date()
        return programs.lazy.filter { $0.start <= now && $0.end > now }.first
    }
    
    var next: Program? {
        return programs.lazy.filter { $0.start > Date() }.first
    }

    @objc
    @available(swift, obsoleted: 1.0, message: "Use array extension [...].firstEndingProgram")
    static func firstEndingProgram(with epg: [ChannelEPG]) -> Program? {
        return epg.firstEndingProgram
    }
}

extension Sequence where Iterator.Element == ChannelEPG {
    
    public func channelEPG(forChannel channel: Channel?) -> ChannelEPG? {
        return lazy.filter { $0.cid == channel?.cid }.first
    }
}

extension Array where Element == ChannelEPG {

    public var firstEndingProgram: Program? {
        var firstEndingProgram: Program?
        for program in (flatMap { $0.programs }) where program.end > Date() {
            if firstEndingProgram == nil || firstEndingProgram!.end > program.end {
                firstEndingProgram = program
            }
        }
        return firstEndingProgram
    }
    
    public func sort(by channels: [Channel]) -> [ChannelEPG] {
        return channels.compactMap {
            channel in
            
            if let index = index(where: { channel.cid == $0.cid }) {
                return self[index]
            }
            else {
                return nil
            }
        }
    }
}
