//
//  VodTermsCatalogEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 07.03.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodTermsCatalogEntity: ModelConvertible {
    
    var model: VodTermsCatalogModel {
        return VodTermsCatalogModel(vodType: vodType.model,
                                         terms: terms.map { $0.model },
                                         disclaimer: disclaimer)
    }
}
