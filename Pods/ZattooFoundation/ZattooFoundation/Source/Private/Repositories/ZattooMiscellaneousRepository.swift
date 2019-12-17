//
//  ZattooMiscellaneousRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero on 03.08.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ZattooMiscellaneousRepository: MiscellaneousRepository {

    private let networkDataSource: MiscellaneousDataSource

    // MARK: - Initializers
    
    init(networkDataSource: MiscellaneousDataSource = ZattooMiscellaneousDataSource()) {
        self.networkDataSource = networkDataSource
    }
    
    // MARK: - MiscellaneousRepository
    
    func localizedContent(key: String,
                          success: @escaping (String) -> Void,
                          failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.localizedContent(
            key: key,
            success: { success($0) },
            failure: { failure($0.model) })
    }
}
