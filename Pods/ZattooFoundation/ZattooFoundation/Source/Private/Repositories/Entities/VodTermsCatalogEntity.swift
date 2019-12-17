//
//  VodTermCatalogEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero on 07.03.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodTermsCatalogEntity: Codable {
    let vodType: VodTypeEntity
    let terms: [VodTermEntity]
    let disclaimer: String?
}
