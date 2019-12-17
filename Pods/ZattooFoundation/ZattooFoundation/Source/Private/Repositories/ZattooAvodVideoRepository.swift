//
//  ZattooAvodVideoRepository.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 7/11/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ZattooAvodVideoRepository: AvodVideoRepository {
    private let networkDataSource: AvodVideoNetworkDataSource
    
    // MARK: - Initializers

    init(networkDataSource: AvodVideoNetworkDataSource = ZattooAvodVideoNetworkDataSource()) {
        self.networkDataSource = networkDataSource
    }
    
    // MARK: - AvodVideoRepository

    @discardableResult
    func search(query: String,
                success: @escaping ([AvodVideoModel]) -> Void,
                failure: @escaping (ErrorModel) -> Void) -> Cancelable? {
        
        return networkDataSource.search(query,
                                        success: { success($0.models) },
                                        failure: { failure($0.model) })
    }

    @discardableResult
    func details(_ token: String,
                 success: @escaping (AvodVideoModel) -> Void,
                 failure: @escaping (ErrorModel) -> Void) -> Cancelable? {

        return networkDataSource.details(token,
                                         success: { success($0.model) },
                                         failure: { failure($0.model) })
    }
}
