//
//  VodWatchListItemEntity.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/2/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodWatchListItemEntity: Codable {
    let teasableId: TeasableId
    let teasableType: TeasableTypeEntity
    let createdAt: Date
}
