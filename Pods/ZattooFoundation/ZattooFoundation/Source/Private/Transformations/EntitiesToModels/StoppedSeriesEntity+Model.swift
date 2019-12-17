//
//  StoppedSeriesEntity+Model.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 1/19/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension StoppedSeriesEntity: ModelConvertible {
    
    var model: StoppedSeriesModel {
        return StoppedSeriesModel(
            numberOfFutureRecordingsDeleted: numberOfFutureRecordingsDeleted,
            isDeletingAsync: isDeletingAsync
        )
    }
}
