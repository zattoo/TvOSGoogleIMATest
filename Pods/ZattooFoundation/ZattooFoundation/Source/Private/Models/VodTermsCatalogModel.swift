//
//  VodTermsCatalogModel.swift
//  ZattooFoundation
//
//  Created by David Cordero on 07.03.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodTermsCatalogModel {
    let vodType: VodTypeModel
    let terms: [VodTermModel]
    let disclaimer: String?
}
