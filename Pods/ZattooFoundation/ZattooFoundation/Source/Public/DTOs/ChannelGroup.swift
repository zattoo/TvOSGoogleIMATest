//
//  ChannelGroup.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 4/14/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class ChannelGroup: NSObject {
    
    public let name: String
    public let channels: [Channel]
    
    init(name: String, channels: [Channel]) {
        self.name = name
        self.channels = channels
    }
}
