//
//  WatchUrlModel+DTO.swift
//  ZattooFoundation
//
//  Created by Abraham Tomas Diaz Abreu on 21.06.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension WatchUrlModel: DTOConvertible {
    
    var DTO: WatchUrl {
        return WatchUrl(audioChannel: audioChannel.DTO, url: url, maxRate: maxRate)
    }
}
