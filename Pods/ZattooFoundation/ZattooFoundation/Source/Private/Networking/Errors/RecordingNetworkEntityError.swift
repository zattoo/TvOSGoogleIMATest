//
//  RecordingNetworkEntityError.swift
//  ZattooFoundation
//
//  Created by David Cordero on 26.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


final class RecordingNetworkEntityError: NetworkEntityError {
    
    let numberToRecord: Int?
    
    required init(code: NetworkEntityErrorCode, localizedDescriptions: [String: String]?) {
        self.numberToRecord = nil
        super.init(code: code, localizedDescriptions: localizedDescriptions)
    }
    
    required init(json: JSON) {
        numberToRecord = json["num_to_record"].int
        super.init(json: json)
    }
}
