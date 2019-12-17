//
//  SubNavigationTabsEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero on 29.07.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation

struct SubNavigationTabsEntity: Codable {
    let publicId: String
    let tabs: [SubNavigationTabEntity]
}
