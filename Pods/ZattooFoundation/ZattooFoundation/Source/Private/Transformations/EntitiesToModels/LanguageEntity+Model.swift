//
//  LanguageEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 04.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension LanguageEntity: ModelConvertible {
    
    var model: LanguageModel {
        return LanguageModel(code: code, name: name)
    }
}

extension Sequence where Iterator.Element == LanguageEntity {
    
    var models: [LanguageModel] {
        return map { $0.model }
    }
}
