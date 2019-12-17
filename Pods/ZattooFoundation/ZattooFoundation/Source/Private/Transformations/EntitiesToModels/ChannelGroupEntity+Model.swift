//
//  ChannelGroupEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 4/20/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation

extension ChannelGroupEntity: ModelConvertible {
    
    var model: ChannelGroupModel {
        return ChannelGroupModel(name: name, channelModels: channelEntities.models)
    }
}