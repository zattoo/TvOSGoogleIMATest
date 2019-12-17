//
//  VodTypeEntity.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/27/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


enum VodTypeEntity: String, CaseIterable, Codable {
    case tvod = "TVOD"
    case est = "EST"
    case svod = "SVOD"
}
