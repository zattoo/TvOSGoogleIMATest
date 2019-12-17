//
//  SwiftyJSON+Helpers.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/21/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftDate
import SwiftyJSON


extension JSON {
    
    func transformEachElement<T>(_ transform: (_ json: JSON) -> T) -> [T] {
        return arrayValue.map(transform)
    }
    
    func transformEachElement<T>(_ transform: (_ json: JSON) -> T?) -> [T] {
        return arrayValue.map(transform).compactMap { $0 }
    }
}

extension JSON {
    
    var date: Date? {
        switch type {
        case .string:
            return Formatter.jsonDateFormatter.date(from: object as! String)
        case .number:
            return Date(timeIntervalSince1970: doubleValue)
        default:
            return nil
        }
    }
    
    var dateValue: Date {
        return date ?? Date(timeIntervalSince1970: 0)
    }
    
    var iso639StringValue: String {
        return iso639String ?? ""
    }
    
    var iso639String: String? {
        return Locale.current.localizedString(forLanguageCode: stringValue)
    }
}

fileprivate class Formatter {
    fileprivate static var jsonDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        return dateFormatter
    }()
}

// MARK: - Entities

extension JSON {
    
    var qualityLevelEntityValue: QualityLevelEntity {
        return QualityLevelEntity(rawValue: stringValue.lowercased()) ?? .default
    }

    var teasableTypeEntity: TeasableTypeEntity? {
        guard let teasableTypeString = string else { return nil }
        return TeasableTypeEntity(rawValue: teasableTypeString)
    }

    var teasableTypeEntityValue: TeasableTypeEntity {
        return teasableTypeEntity ?? .generic
    }
    
    var navigationContextValue: EditorialNavigationContextEntity? {
        return EditorialNavigationContextEntity(rawValue: stringValue)
    }
}
