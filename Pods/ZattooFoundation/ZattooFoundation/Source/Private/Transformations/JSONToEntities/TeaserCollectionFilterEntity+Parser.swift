//
//  TeaserCollectionFilterEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 21.09.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension TeaserCollectionFilterEntity {

    init(json: JSON) {
        id = json["param"].stringValue
        name = json["label"].stringValue
        values = json["values"].transformEachElement(toTeaserCollectionFilterValueEntity)
    }
}

private func toTeaserCollectionFilterValueEntity(json: JSON) -> TeaserCollectionFilterValueEntity? {
    return  TeaserCollectionFilterValueEntity(json: json)
}
