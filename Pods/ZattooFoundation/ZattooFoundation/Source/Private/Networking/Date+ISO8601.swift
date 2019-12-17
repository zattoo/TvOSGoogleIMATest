//
//  Date+ISO8601.swift
//  ZattooFoundation
//
//  Created by David Cordero on 13/09/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension Date {
    
    func ISO8601String() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        
        return dateFormatter.string(from: self) + "Z"
    }
}
