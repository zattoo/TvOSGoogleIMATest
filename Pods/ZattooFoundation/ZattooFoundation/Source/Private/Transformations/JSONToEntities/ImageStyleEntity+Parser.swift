//
//  ImageStyleEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/18/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension JSON {

    var imageStyleEntityValue: ImageStyleEntity {
        return ImageStyleEntity(rawValue: stringValue) ?? .landscape
    }
}
