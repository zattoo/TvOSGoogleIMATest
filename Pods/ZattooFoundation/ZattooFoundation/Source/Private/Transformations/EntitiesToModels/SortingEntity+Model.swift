//
//  SortingEntity+Model.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 27.09.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension SortingEntity: ModelConvertible {

    var model: SortingModel {
        return SortingModel(name: name, value: value)
    }
}
