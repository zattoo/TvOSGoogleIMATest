//
//  TeaserCollectionFilterEntity+Model.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 21.09.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension TeaserCollectionFilterEntity: ModelConvertible {

    var model: TeaserCollectionFilterModel {
        return TeaserCollectionFilterModel(id: id, name: name, values: values.models)
    }
}
