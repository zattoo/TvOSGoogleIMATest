//
//  LanguageModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 04.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension LanguageModel: DTOConvertible {
    
    var DTO: Language {
        return Language(code: code, name: name)
    }
}


extension Sequence where Iterator.Element == LanguageModel {
    
    var DTOs: [Language] {
        return map { $0.DTO }
    }
}
