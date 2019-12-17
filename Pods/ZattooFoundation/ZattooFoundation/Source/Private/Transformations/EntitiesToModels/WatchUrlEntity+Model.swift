//
//  WatchUrlEntity+Model.swift
//  ZattooFoundation
//
//  Created by Abraham Tomas Diaz Abreu on 21.06.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension WatchUrlEntity: ModelConvertible {
    
    var model: WatchUrlModel {
        return WatchUrlModel(audioChannel: audioChannel.model,
                           url: url,
                           maxRate: maxRate)
    }
}
