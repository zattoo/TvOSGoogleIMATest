//
//  ChannelEPGEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/4/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension ChannelEPGEntity: ModelConvertible {
    
    var model: ChannelEPGModel {
        return ChannelEPGModel(
            cid: cid,
            programs: programs.map { $0.model.with(cid: cid) }
        )
    }
}
