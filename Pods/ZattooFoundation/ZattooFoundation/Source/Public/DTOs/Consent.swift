//
//  Consent.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 29.08.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class Consent: NSObject {

    public let id: String
    public let value: Bool?
    public let confirmationOnly: Bool
    public let title: String
    public let linkTitle: String
    public let infoText: String
    public let redirectUrl: URL?
    public let embedUrl: URL?
    public let plainTextUrl: URL?

    init(id: String,
         value: Bool?,
         confirmationOnly: Bool,
         title: String,
         linkTitle: String,
         infoText: String,
         redirectUrl: URL?,
         embedUrl: URL?,
         plainTextUrl: URL?) {

        self.id = id
        self.value = value
        self.confirmationOnly = confirmationOnly
        self.title = title
        self.linkTitle = linkTitle
        self.infoText = infoText
        self.redirectUrl = redirectUrl
        self.embedUrl = embedUrl
        self.plainTextUrl = plainTextUrl
    }
}
