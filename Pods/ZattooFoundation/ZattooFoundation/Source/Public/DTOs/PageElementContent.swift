//
//  PageElementContent.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation

@objc(ZattooFoundationPageElementContent)
final public class PageElementContent: NSObject {
    
    public let style: PageElementContentStyle
    public let perPage: Int
    public let publicId: String
    
    init(style: PageElementContentStyle, perPage: Int, publicId: String) {
        self.style = style
        self.perPage = perPage
        self.publicId = publicId
    }
    
}

public enum PageElementContentStyle: String {
    case generic
    case marquee
    case channelCarousel
    case carousel
    case subNavigation
}
