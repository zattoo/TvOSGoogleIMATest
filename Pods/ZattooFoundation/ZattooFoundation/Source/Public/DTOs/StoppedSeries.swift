//
//  StoppedSeries.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 1/19/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class StoppedSeries: NSObject {
    
    public let numberOfFutureRecordingsDeleted: Int
    public let isDeletingAsync: Bool
    
    init(numberOfFutureRecordingsDeleted: Int, isDeletingAsync: Bool) {
        self.numberOfFutureRecordingsDeleted = numberOfFutureRecordingsDeleted
        self.isDeletingAsync = isDeletingAsync
    }
}
