//
//  DisplayAdModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.04.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation

extension DisplayAdModel: DTOConvertible {

    var DTO: DisplayAd {
        return DisplayAd(unitPath: unitPath, sizes: sizes, targets: targets)
    }
}
