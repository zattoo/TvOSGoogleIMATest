//
//  StoppedSeriesModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 1/19/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension StoppedSeriesModel: DTOConvertible {
    
    var DTO: StoppedSeries {
        return StoppedSeries(
            numberOfFutureRecordingsDeleted: numberOfFutureRecordingsDeleted,
            isDeletingAsync: isDeletingAsync
        )
    }
}
