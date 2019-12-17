//
//  DisplayAdEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.04.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension DisplayAdEntity: ModelConvertible {

    var model: DisplayAdModel {
        return DisplayAdModel(unitPath: unitPath, sizes: sizes, targets: targets)
    }
}
