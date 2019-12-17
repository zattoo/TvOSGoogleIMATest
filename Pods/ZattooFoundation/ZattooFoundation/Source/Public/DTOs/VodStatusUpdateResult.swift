//
//  VodStatusUpdateResult.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/9/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


public struct VodStatusUpdateResult {
    public let teasableId: TeasableId
    public let teasableType: TeasableType
    public let position: TimeInterval
    public let captionLanguageCode: String
    public let audioLanguageCode: String
}
