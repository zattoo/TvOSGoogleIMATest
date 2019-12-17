//
//  BrandEntity+Model.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 11/6/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension BrandEntity: ModelConvertible {

    var model: BrandModel {
        return BrandModel(id: id, title: title, logoToken: logoToken)
    }
}
