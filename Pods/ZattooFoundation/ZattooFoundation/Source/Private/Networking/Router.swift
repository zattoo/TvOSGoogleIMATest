//
//  Router.swift
//  Zattoo
//
//  Created by Christopher Goldsby on 9/24/15.
//  Copyright © 2015 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire


struct Router: URLConvertible {
    private let path: String
    private let configuration: Configuration
    private let isPathPrefixRequired: Bool

    init(_ path: String, configuration: Configuration = ZattooConfiguration.shared, isPathPrefixRequired: Bool = true) {
        self.path = path
        self.configuration = configuration
        self.isPathPrefixRequired = isPathPrefixRequired
    }
    
    // MARK: - URLConvertible
    
    func asURL() throws -> URL {
        let adjustedPath = isPathPrefixRequired ? ("/zapi/" + path) : path
        return try (configuration.zapiHostUrl.absoluteString + adjustedPath).asURL()
    }
}
