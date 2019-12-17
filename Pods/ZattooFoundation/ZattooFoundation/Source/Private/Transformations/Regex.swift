//
//  Regex.swift
//  ZattooFoundation
//
//  Created by David Cordero on 24.04.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


final class Regex {
    
    static func matches(for regex: String, in text: String) -> (matches: [String], captures: [String]) {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: [])
            let nsString = text as NSString
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            
            var matches = [String]()
            var captures = [String]()
            
            for result in results {
                matches.append(nsString.substring(with: result.range(at: 0)))
                
                for i in 1..<result.numberOfRanges {
                    captures.append(nsString.substring(with: result.range(at: i)))
                }
            }
            return (matches: matches, captures: captures)
        } catch {
            return (matches: [], captures: [])
        }
    }
}
