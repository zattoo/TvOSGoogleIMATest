//
//  QualityLevelEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/1/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


enum QualityLevelEntity: String, Codable {
    case sd
    case hd
    case uhd
    
    static var `default` = QualityLevelEntity.sd
}
