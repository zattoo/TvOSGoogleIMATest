//
//  ZattooProgramRepository.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 25.09.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ZattooProgramRepository: ProgramRepository {
    private let networkDataSource: ProgramNetworkDataSource
    
    // MARK: - Initializers
    
    init(networkDataSource: ProgramNetworkDataSource = ZattooProgramNetworkDataSource()) {
        self.networkDataSource = networkDataSource
    }
    
    // MARK: - AvodVideoRepository
    
    @discardableResult
    func search(query: String,
                timeframe: ProgramSearchTimeframe,
                success: @escaping ([ProgramModel]) -> Void,
                failure: @escaping (ErrorModel) -> Void) -> Cancelable? {
        
        return networkDataSource.search(query,
                                        timeframe: timeframe,
                                        success: { success($0.models) },
                                        failure: { failure($0.model) })
    }
}
