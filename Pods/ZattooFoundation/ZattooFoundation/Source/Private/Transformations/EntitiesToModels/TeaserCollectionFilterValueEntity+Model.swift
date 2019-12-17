//
//  TeaserCollectionFilterValueEntity+Model.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/12/18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension TeaserCollectionFilterValueEntity: ModelConvertible {

    var model: TeaserCollectionFilterValueModel {
        return  TeaserCollectionFilterValueModel(label: label, value: value)
    }
}

extension Sequence where Element == TeaserCollectionFilterValueEntity {

    var models: [TeaserCollectionFilterValueModel] {
        return map { $0.model }
    }
}
