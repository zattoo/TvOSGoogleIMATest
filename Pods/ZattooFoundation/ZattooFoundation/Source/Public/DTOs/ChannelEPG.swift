//
//  ChannelEPG.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/4/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


@objcMembers
final public class ChannelEPG: NSObject {
    public let cid: ChannelId
    public let programs: [Program]
    
    init(cid: ChannelId, programs: [Program]) {
        self.cid = cid
        self.programs = programs
    }
}
