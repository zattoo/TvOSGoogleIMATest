//
//  EditorialAdEntity+Model.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 28.02.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension EditorialAdEntity: ModelConvertible {

    var model: EditorialAdModel {
        return EditorialAdModel(zapiPath: zapiPath, style: style, type: type.model)
    }
}

extension EditorialAdTypeEntity: ModelConvertible {

    var model: EditorialAdTypeModel {
        switch self {
        case .display:
            return .display
        }
    }
}
