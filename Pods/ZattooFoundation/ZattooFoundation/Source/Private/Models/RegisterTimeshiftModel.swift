//
//  RegisterTimeshiftModel.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 9/12/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


struct RegisterTimeshiftModel {
    
    let registeredAt: Date
    let allowedOffset: Int
    let allowedQualityLevel: QualityLevelModel
    let isForwardSeekingEnabled: Bool
}
