//
//  ZattooRecordingsResponse.swift
//  ZattooFoundation
//
//  Created by David Cordero on 18/08/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooRecordingsResponse: SwiftyJsonResponseSerializable {
    let listOfRecordings: ListOfRecordingsEntity

    // MARK: - SwiftyJsonResponseSerializable
    
    init?(json: JSON) {
        guard json["success"].boolValue else { return nil }
        listOfRecordings = ListOfRecordingsEntity(json: json)
    }
}
