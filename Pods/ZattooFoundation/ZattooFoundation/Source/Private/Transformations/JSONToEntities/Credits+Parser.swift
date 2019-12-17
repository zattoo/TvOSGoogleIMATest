//
//  Credits+Parser.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 7/12/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension JSON {
    
    var creditsValue: Credits {
        var credits = Credits()
        for (role, JSON) in dictionaryValue {
            if let names = JSON.array?.map({ $0.string }).compactMap({ $0 }), !names.isEmpty {
                credits[role] = names
            } else if let names = JSON.array?.map({ $0["name"].string }).compactMap({ $0 }), !names.isEmpty {
                credits[role] = names
            }
        }
        
        return credits
    }
}
