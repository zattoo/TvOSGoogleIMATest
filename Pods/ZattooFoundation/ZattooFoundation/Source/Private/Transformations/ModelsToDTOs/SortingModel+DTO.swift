//
//  SortingModel+DTO.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 27.09.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension SortingModel: DTOConvertible {

    var DTO: TeaserCollectionSorting {
        return TeaserCollectionSorting(name: name, value: value)
    }

    var seriesDTO: SeriesSorting {
        return SeriesSorting(name: name, value: value)
    }
}
