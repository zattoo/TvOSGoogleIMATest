//
//  SubNavigationTabs.swift
//  ZattooFoundation
//
//  Created by David Cordero on 31.07.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class SubNavigationTabs: NSObject {
    
    public let publicId: String
    public let tabs: [SubNavigationTab]
    
    init(publicId: String,
         tabs: [SubNavigationTab]) {
        
        self.publicId = publicId
        self.tabs = tabs
    }
}
