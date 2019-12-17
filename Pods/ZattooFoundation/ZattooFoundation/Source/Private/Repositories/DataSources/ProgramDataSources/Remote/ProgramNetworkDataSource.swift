//
//  ProgramNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 25.09.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol ProgramNetworkDataSource {
    
    @discardableResult
    func search(_ query: String,
                timeframe: ProgramSearchTimeframe,
                success: @escaping ([ProgramEntity]) -> Void,
                failure: @escaping (NetworkEntityError) -> Void) -> Cancelable?
}
