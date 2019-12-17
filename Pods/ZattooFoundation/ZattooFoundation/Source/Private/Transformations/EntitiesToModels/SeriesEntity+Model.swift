//
//  SeriesEntity+Model.swift
//  ZattooFoundation
//
//  Created by Abraham Tomás Díaz Abreu on 24/10/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension SeriesEntity: ModelConvertible {
    
    var model: SeriesModel {
        return SeriesModel(id: NSNumber(value: id), numTotal: numTotal, numRecorded: numRecorded, isAddingAsync: isAddingAsync)
    }
}
