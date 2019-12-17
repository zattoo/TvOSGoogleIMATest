//
//  ProgramRepository.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 25.09.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol ProgramRepository {
    
    @discardableResult
    func search(query: String,
                timeframe: ProgramSearchTimeframe,
                success: @escaping ([ProgramModel]) -> Void,
                failure: @escaping (ErrorModel) -> Void) -> Cancelable?
}
