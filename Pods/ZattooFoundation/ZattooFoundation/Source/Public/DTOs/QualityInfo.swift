//
//  QualityInfo.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 4/14/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class QualityInfo: NSObject {
    
    public let availability: Availability
    public let qualityLevel: QualityLevel
    public let title: String
    public let logoToken: String?
    public let streamTypes: [String]
    public let drmRequired: Bool
    
    init(availability: Availability, qualityLevel: QualityLevel, title: String, logoToken: String?, streamTypes: [String], drmRequired: Bool) {
        
        self.availability = availability
        self.qualityLevel = qualityLevel
        self.title = title
        self.logoToken = logoToken
        self.streamTypes = streamTypes
        self.drmRequired = drmRequired
    }
}
