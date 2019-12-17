//
//  SubNavigationTabEntity+Model.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 20.09.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension SubNavigationTabEntity: ModelConvertible {

    var model: SubNavigationTabModel {
        return SubNavigationTabModel(contentId: contentId, contentType: contentType.model, title: title)
    }
}

extension Sequence where Iterator.Element == SubNavigationTabEntity {
    
    var models: [SubNavigationTabModel] {
        return map { $0.model }
    }
}
