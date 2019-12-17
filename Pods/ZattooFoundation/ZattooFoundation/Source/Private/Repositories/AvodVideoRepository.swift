//
//  AvodVideoRepository.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 7/11/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol AvodVideoRepository {
    
    @discardableResult
    func search(query: String,
                success: @escaping ([AvodVideoModel]) -> Void,
                failure: @escaping (ErrorModel) -> Void) -> Cancelable?

    @discardableResult
    func details(_ token: String,
                 success: @escaping (AvodVideoModel) -> Void,
                 failure: @escaping (ErrorModel) -> Void) -> Cancelable?
}
