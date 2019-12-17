//
//  TeaserCollectionFilterEntity.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 21.09.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


struct TeaserCollectionFilterEntity: Codable {
    let id: String
    let name: String
    let values: [TeaserCollectionFilterValueEntity]
}
