//
//  ZattooConsentsResponse.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 29.08.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooConsentsResponse: SwiftyJsonResponseSerializable {
    let consents: [ConsentEntity]

    // MARK: - SwiftyJsonResponseSerializable

    init?(json: JSON) {
        guard json["success"].boolValue else { return nil }
        consents = json["consents"].arrayValue.map({ ConsentEntity(json: $0) })
    }
}
