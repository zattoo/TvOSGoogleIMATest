//
//  ZattooSingleRecordingResponse.swift
//  ZattooFoundation
//
//  Created by David Cordero on 19/08/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooSingleRecordingResponse: SwiftyJsonResponseSerializable {
    let recording: RecordingEntity
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init?(json: JSON) {
        guard json["success"].boolValue else { return nil }
        recording = RecordingEntity(json: json["recording"])
    }
}
