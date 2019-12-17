//
//  VodWatchListModel.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/4/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


struct VodWatchListModel {
    let watchList: [TeasableTypeModel: [TeasableId: VodWatchListItemModel]]
}
