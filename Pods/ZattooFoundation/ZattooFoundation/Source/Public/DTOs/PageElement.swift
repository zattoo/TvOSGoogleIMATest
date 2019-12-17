//
//  PageElement.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation

@objc(ZattooFoundationPageElement)
final public class PageElement: NSObject {

    public let zapiParams: [String: String]
    public let zapiPath: String
    public let contentId: String
    public let contentType: PageElementContentType
    public let content: PageElementContent
    public let teaserCollection: TeaserCollection?
    public let subNavigationTabs: SubNavigationTabs?
    
    init(zapiParams: [String: String],
         zapiPath: String,
         contentId: String,
         contentType: PageElementContentType,
         content: PageElementContent,
         teaserCollection: TeaserCollection?,
         subNavigationTabs: SubNavigationTabs?) {

        self.zapiParams = zapiParams
        self.zapiPath = zapiPath
        self.contentId = contentId
        self.contentType = contentType
        self.content = content
        self.teaserCollection = teaserCollection
        self.subNavigationTabs = subNavigationTabs
    }
}
