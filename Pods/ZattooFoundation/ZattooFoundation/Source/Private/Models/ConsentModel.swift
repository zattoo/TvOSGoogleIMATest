//
//  ConsentModel.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 29.08.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ConsentModel {
    let id: String
    let value: Bool?
    let confirmationOnly: Bool
    let title: String
    let linkTitle: String
    let infoText: String
    let redirectUrl: URL?
    let embedUrl: URL?
    let plainTextUrl: URL?
}

