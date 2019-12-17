//
//  EasycastReceiverEntity+Model.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 06.12.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension EasycastReceiverEntity: ModelConvertible {

    var model: EasycastReceiverModel {
        return EasycastReceiverModel(state: state, deviceID: deviceID, baseURL: baseURL, name: name)
    }
}

extension Sequence where Iterator.Element == EasycastReceiverEntity {

    var models: [EasycastReceiverModel] {
        return map { $0.model }
    }
}
