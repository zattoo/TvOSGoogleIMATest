//
//  String+Helpers.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 5/19/17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


private let metadataTextSeparator = "    "

extension String {
    
    public var isBlank: Bool {
        return trimmingCharacters(in: .whitespaces).isEmpty
    }

    public var replaceUmlauts: String {
        return replacingOccurrences(of: "ä", with: "ae", options: .caseInsensitive)
            .replacingOccurrences(of: "ö", with: "oe", options: .caseInsensitive)
            .replacingOccurrences(of: "ü", with: "ue", options: .caseInsensitive)
            .replacingOccurrences(of: "ß", with: "ss")
    }

    public var webClientParameterization: String {
        return replaceUmlauts
            .replacingOccurrences(of: "[\\s-]+", with: "-", options: .regularExpression)
            .replacingOccurrences(of: "[^\\w-]", with: "", options: .regularExpression)
            .lowercased()
    }
    
    public var initials: String {
        let stringComponents = components(separatedBy: " ")
        var initials = ""

        if let firstInitial = stringComponents.first?.first {
            initials += String(firstInitial)
        }

        if stringComponents.count > 1, let lastInitial = stringComponents.last?.first {
            initials += String(lastInitial)
        }

        return initials
    }
}

extension Optional where Wrapped == String {
    
    public var isBlank: Bool {
        return self?.isBlank ?? true
    }
}

extension Sequence where Iterator.Element == String {
    
    public func removeBlankStringsAndJoin() -> String {
        return filter { !$0.isBlank }.joined(separator: metadataTextSeparator)
    }
}
