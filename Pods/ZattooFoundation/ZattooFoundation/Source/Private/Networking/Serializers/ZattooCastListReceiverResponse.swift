//
//  ZattooCastListReceiverResponse.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 06.12.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooCastListReceiverResponse: SwiftyJsonResponseSerializable {

    let castReceivers: [EasycastReceiverEntity]

    // MARK: - SwiftyJsonResponseSerializable

    init(json: JSON) {
        castReceivers = json["devices"].transformEachElement(toEasycastReceiverEntity)
    }
}

// MARK: - Private

private func toEasycastReceiverEntity(json: JSON) -> EasycastReceiverEntity? {
    return EasycastReceiverEntity(json: json)
}
