//
//  TeaserCollectionFilterModel+DTO.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 21.09.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension TeaserCollectionFilterModel: DTOConvertible {

    var DTO: TeaserCollectionFilter {
        return TeaserCollectionFilter(id: id, name: name, values: values.DTOs)
    }
}
