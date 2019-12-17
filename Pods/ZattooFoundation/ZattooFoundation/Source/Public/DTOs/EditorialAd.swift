//
//  EditorialAd.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 28.02.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc(ZattooFoundationEditorialAd)
final public class EditorialAd: NSObject {
    public let zapiPath: String
    public let style: String
    public let type: EditorialAdType

    public init(zapiPath: String, style: String, type: EditorialAdType) {
        self.zapiPath = zapiPath
        self.style = style
        self.type = type
    }
}

@objc public enum EditorialAdType: Int {
    case display
}
