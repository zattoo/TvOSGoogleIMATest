//
//  Page.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation

@objc(ZattooFoundationPage)
final public class Page: NSObject {
    
    public let publicId: String
    public let style: PageStyle
    public let title: String
    public let logoToken: String?
    public var pageElements: [PageElement]
    public let ad: EditorialAd?
    public let subNavigationPublicId: String?
    public let displayEmptyRecordings: Bool
    public let displayTotalRecordings: Bool
    public let navigationContext: EditorialNavigationContext?
    
    public init(publicId: String, style: PageStyle, title: String, logoToken: String?, pageElements: [PageElement], ad: EditorialAd?, subNavigationPublicId: String?, displayEmptyRecordings: Bool, displayTotalRecordings: Bool, navigationContext: EditorialNavigationContext?) {
        self.publicId = publicId
        self.style = style
        self.title = title
        self.logoToken = logoToken
        self.pageElements = pageElements
        self.ad = ad
        self.subNavigationPublicId = subNavigationPublicId
        self.displayEmptyRecordings = displayEmptyRecordings
        self.displayTotalRecordings = displayTotalRecordings
        self.navigationContext = navigationContext
    }
}
