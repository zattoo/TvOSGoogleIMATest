//
//  VodStatusUpdateResultEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/8/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension VodStatusUpdateResultEntity {

    init(json: JSON) {
        teasableId = json["teasable_id"].stringValue
        teasableType = json["teasable_type"].teasableTypeEntityValue
        position = json["position"].doubleValue
        captionLanguageCode = json["caption_language_code"].stringValue
        audioLanguageCode = json["audio_language_code"].stringValue
    }
}
