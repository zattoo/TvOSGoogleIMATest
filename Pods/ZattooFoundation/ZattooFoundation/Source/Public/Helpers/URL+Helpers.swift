//
//  URL+Helpers.swift
//  Zattoo
//
//  Created by Daniel Janes on 28/03/2017.
//  Copyright © 2017 Zattoo. All rights reserved.
//

import Foundation


extension URL {
    
    public var queryItems: [String: String] {
        var parameters = [String : String]()
        let components = URLComponents(url: self, resolvingAgainstBaseURL: false)
        components?.queryItems?.forEach { parameters[$0.name] = $0.value }
        return parameters
    }
    
    public func appendingQueryItem(key: String, value: String) -> URL? {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)
        
        if urlComponents?.queryItems != nil {
            urlComponents?.queryItems?.append(URLQueryItem(name: key, value: value))
        } else {
            urlComponents?.queryItems = [URLQueryItem(name: key, value: value)]
        }
        
        return urlComponents?.url
    }

    public func asSecureURL() -> URL? {
        guard let scheme = scheme else { return nil }
        guard scheme.lowercased() != "https" else { return self }
        guard scheme.lowercased() == "http" else { return nil }
        guard var urlComps = URLComponents(url: self, resolvingAgainstBaseURL: false) else { return nil }

        urlComps.scheme = "https"

        return urlComps.url
    }
}
