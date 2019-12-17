//
//  RegisterTimeshift.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 9/12/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class RegisterTimeshift: NSObject {
    
    public let registeredAt: Date
    public let allowedOffset: Int
    public let allowedQualityLevel: QualityLevel
    public let isForwardSeekingEnabled: Bool
    
    public init(registeredAt: Date,
                allowedOffset: Int,
                allowedQualityLevel: QualityLevel,
                isForwardSeekingEnabled: Bool) {
        
        self.registeredAt = registeredAt
        self.allowedOffset = allowedOffset
        self.allowedQualityLevel = allowedQualityLevel
        self.isForwardSeekingEnabled = isForwardSeekingEnabled
    }
}
