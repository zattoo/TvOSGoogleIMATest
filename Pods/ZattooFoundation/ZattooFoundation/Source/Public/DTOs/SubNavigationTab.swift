//
//  SubNavigationTab.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 20.09.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class SubNavigationTab: NSObject {

    public let contentId: String
    public let contentType: TeasableType
    public let title: String

    init(contentId: String, contentType: TeasableType, title: String) {
        self.contentId = contentId
        self.contentType = contentType
        self.title = title
    }
}
