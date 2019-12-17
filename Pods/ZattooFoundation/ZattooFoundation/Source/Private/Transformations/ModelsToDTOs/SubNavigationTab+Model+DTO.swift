//
//  SubNavigationTab+Model+DTO.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 20.09.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension SubNavigationTabModel: DTOConvertible {

    var DTO: SubNavigationTab {
        return SubNavigationTab(contentId: contentId, contentType: contentType.DTO, title: title)
    }
}

extension Sequence where Iterator.Element == SubNavigationTabModel {
    
    var DTOs: [SubNavigationTab] {
        return map { $0.DTO }
    }
}
