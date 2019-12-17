//
//  VodWatchListItemModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/4/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodWatchListItemModel: DTOConvertible {

    var DTO: VodWatchListItem {
        VodWatchListItem(
            teasableId: teasableId,
            teasableType: teasableType.DTO,
            createdAt: createdAt
        )
    }
}
