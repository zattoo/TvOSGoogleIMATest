//
//  Environment.swift
//  ZattooFoundation
//
//  Created by David Cordero on 21.11.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


public enum Environment: Int {
    case production
    case staging
    case sandbox
    case qa
    
    public var title: String {
        switch self {
        case .production: return "Production"
        case .staging: return "Staging"
        case .sandbox: return "Sandbox"
        case .qa: return "QA"
        }
    }
        
    public var host: URL {
        switch self {
        case .production:
            return ZattooConfiguration.shared.productionZapiUrl
        case .staging:
            return URL(string: "https://staging.zattoo.com")!
        case .sandbox:
            return URL(string: "https://sandbox.zattoo.com")!
        case .qa:
            return URL(string: "https://qa.zattoo.com")!
        }
    }
}
