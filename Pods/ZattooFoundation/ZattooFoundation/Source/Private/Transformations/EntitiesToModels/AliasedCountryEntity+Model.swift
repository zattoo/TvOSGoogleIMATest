//
//  AliasedCountryEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 07.12.16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension AliasedCountryEntity: ModelConvertible {
    
    var model: AliasedCountryModel {
        switch self {
        case .denmark:
            return .denmark
        case .deutchland:
            return .deutchland
        case .france:
            return .france
        case .spain:
            return .spain
        case .switzerland:
            return .switzerland
        case .unitedKingdom:
            return .unitedKingdom
        }
    }
}
