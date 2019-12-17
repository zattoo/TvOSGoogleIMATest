//
//  BrandModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 11/6/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension BrandModel: DTOConvertible {

    var DTO: Brand {
        return Brand(id: id, title: title, logoToken: logoToken)
    }
}
