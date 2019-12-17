//
//  SeriesEntity.swift
//  ZattooFoundation
//
//  Created by Abraham Tomás Díaz Abreu on 20/10/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct SeriesEntity: Codable {
    
    let id: Int
    let numTotal: Int
    let numRecorded: Int
    let isAddingAsync: Bool
}
