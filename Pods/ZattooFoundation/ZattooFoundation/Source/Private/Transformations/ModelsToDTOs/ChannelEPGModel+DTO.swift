//
//  ChannelEPGModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/4/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension ChannelEPGModel: DTOConvertible {
    
    var DTO: ChannelEPG {
        return ChannelEPG(cid: cid,
                          programs: programs.map { $0.DTO })
    }
}
