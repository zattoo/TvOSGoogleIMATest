//
//  EasycastReceiverModel+DTO.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 11.12.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension EasycastReceiverModel: DTOConvertible {

    var DTO: EasycastReceiver {
        return EasycastReceiver(state: state, uniqueID: deviceID, baseURL: baseURL, friendlyName: name)
    }
}

extension Sequence where Iterator.Element == EasycastReceiverModel {

    var DTOs: [EasycastReceiver] {
        return map { $0.DTO }
    }
}
