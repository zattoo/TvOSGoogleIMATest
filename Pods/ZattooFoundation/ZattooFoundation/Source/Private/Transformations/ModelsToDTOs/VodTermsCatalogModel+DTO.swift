//
//  VodTermsCatalogModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 07.03.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodTermsCatalogModel: DTOConvertible {
    
    var DTO: VodTermsCatalog {
        return VodTermsCatalog(vodType: vodType.DTO,
                                    terms: terms.map { $0.DTO },
                                    disclaimer: disclaimer)
    }
}
