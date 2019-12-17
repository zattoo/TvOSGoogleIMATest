//
//  TeaserCollectionFilterValueEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/12/18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension TeaserCollectionFilterValueEntity {

    init?(json: JSON) {
        guard let label = json["label"].string,
            let value = json["value"].string else { return nil }
        self.label = label
        self.value = value
    }
}
