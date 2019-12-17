//
//  SeriesModel+DTO.swift
//  ZattooFoundation
//
//  Created by Abraham Tomás Díaz Abreu on 27/10/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension SeriesModel: DTOConvertible {

    var DTO: Series {
        return Series(id: id, numTotal: numTotal, numRecorded: numRecorded, isAddingAsync: isAddingAsync)
    }
}
