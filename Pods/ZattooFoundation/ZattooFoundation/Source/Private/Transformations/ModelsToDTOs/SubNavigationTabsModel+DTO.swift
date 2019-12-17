//
//  SubNavigationTabsModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 31.07.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension SubNavigationTabsModel: DTOConvertible {
    
    var DTO: SubNavigationTabs {
        return SubNavigationTabs(publicId: publicId, tabs: tabs.DTOs)
    }
}
