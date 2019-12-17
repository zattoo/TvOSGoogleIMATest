//
//  VodStatusCollectionEntity.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/22/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


typealias VodStatusEntityDictionary = [TeasableId: VodStatusEntity]
typealias VodStatusesEntity = [TeasableTypeEntity: VodStatusEntityDictionary]

struct VodStatusCollectionEntity: Codable {

    let statuses: VodStatusesEntity
}
