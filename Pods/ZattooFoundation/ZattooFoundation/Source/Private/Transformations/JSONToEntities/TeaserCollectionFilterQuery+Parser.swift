//
//  TeaserCollectionFilterQuery+Parser.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/12/18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension JSON {

    var teaserCollectionFilterQueryValue: TeaserCollectionFilterQuery {
        return dictionaryValue.mapValues { $0.arrayValue.map { $0.stringValue } }
    }
}
