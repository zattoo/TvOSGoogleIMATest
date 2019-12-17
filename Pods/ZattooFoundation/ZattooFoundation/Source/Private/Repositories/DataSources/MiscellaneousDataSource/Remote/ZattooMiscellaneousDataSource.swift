//
//  ZattooMiscellaneousDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero on 03.08.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire


struct ZattooMiscellaneousDataSource: MiscellaneousDataSource {
    
    private let manager: SessionManager

    init(manager: SessionManager = SessionManager.shared) {
        self.manager = manager
    }
    
    // MARK: - MiscellaneousDataSource
    
    func localizedContent(key: String,
                          success: @escaping (String) -> Void,
                          failure: @escaping (NetworkEntityError) -> Void) {
        
        manager.request(endpoint: .localizedContent(key: key)).response {
            result in
            guard result.response?.statusCode == 200,
                let data = result.data,
                let response = String(data: data, encoding: String.Encoding.utf8) else {
                    return failure(NetworkEntityError(code: .🔥))
            }
            success(response)
        }
    }
}
