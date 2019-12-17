//
//  ImageStyleEntity+Model.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/18/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension ImageStyleEntity: ModelConvertible {

    var model: ImageStyleModel {
        switch self {
        case .landscape:
            return .landscape
        case .portrait:
            return .portrait
        }
    }
}
