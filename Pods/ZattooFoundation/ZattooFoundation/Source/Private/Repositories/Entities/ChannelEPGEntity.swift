//
//  ChannelEPGEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/4/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ChannelEPGEntity: Codable {
    let cid: ChannelId
    let programs: [ProgramEntity]
}
