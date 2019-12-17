//
//  SubNavigationTabsEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 31.07.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension SubNavigationTabsEntity: ModelConvertible {
    
    var model: SubNavigationTabsModel {
        return SubNavigationTabsModel(publicId: publicId, tabs: tabs.models)
    }
}
