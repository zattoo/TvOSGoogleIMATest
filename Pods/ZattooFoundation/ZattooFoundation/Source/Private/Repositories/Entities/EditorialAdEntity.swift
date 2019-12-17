//
//  EditorialAdEntity.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 27.02.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


struct EditorialAdEntity: Codable {
    let zapiPath: String
    let style: String
    let type: EditorialAdTypeEntity
}

enum EditorialAdTypeEntity: String, Codable {
    case display
}
