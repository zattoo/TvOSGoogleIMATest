//
//  TeaserCollectionFilterValueModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/12/18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension TeaserCollectionFilterValueModel: DTOConvertible {

    var DTO: TeaserCollectionFilterValue {
        return TeaserCollectionFilterValue(label: label, value: value)
    }
}

extension Sequence where Element == TeaserCollectionFilterValueModel {

    var DTOs: [TeaserCollectionFilterValue] {
        return map { $0.DTO }
    }
}
