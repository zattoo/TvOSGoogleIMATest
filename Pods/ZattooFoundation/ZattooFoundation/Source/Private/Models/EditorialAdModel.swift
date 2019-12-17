//
//  EditorialAdModel.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 28.02.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


struct EditorialAdModel {
    let zapiPath: String
    let style: String
    let type: EditorialAdTypeModel
}

enum EditorialAdTypeModel: String, Codable {
    case display
}
