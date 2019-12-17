//
//  Series.swift
//  ZattooFoundation
//
//  Created by Abraham Tomás Díaz Abreu on 25/10/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


public typealias SeriesId = NSNumber
public typealias SeasonNumber = NSNumber

final public class Series: NSObject {

    public let id: SeriesId
    public let numTotal: Int
    public let numRecorded: Int
    public let isAddingAsync: Bool
    
    init(id: SeriesId, numTotal: Int, numRecorded: Int, isAddingAsync: Bool) {
        self.id = id
        self.numTotal = numTotal
        self.numRecorded = numRecorded
        self.isAddingAsync = isAddingAsync
    }
}
