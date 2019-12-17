//
//  ServiceEntity.swift
//  ZattooFoundation
//
//  Created by David Cordero on 07.12.16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ServiceEntity: Codable {
    let id: Int?
    let name: String?
    let type: String?
    let subservices: [Int]
}
