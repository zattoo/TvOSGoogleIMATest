//
//  EditorialAdModel+DTO.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 28.02.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension EditorialAdModel: DTOConvertible {

    var DTO: EditorialAd {
        return EditorialAd(zapiPath: zapiPath, style: style, type: type.DTO)
    }
}

extension EditorialAdTypeModel: DTOConvertible {

    var DTO: EditorialAdType {
        switch self {
        case .display:
            return .display
        }
    }
}
