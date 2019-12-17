//
//  AvodVideoNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 7/7/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol AvodVideoNetworkDataSource {

    @discardableResult
    func search(_ query: String,
                success: @escaping ([AvodVideoEntity]) -> Void,
                failure: @escaping (NetworkEntityError) -> Void) -> Cancelable?

    @discardableResult
    func details(_ token: String,
                 success: @escaping (AvodVideoEntity) -> Void,
                 failure: @escaping (NetworkEntityError) -> Void) -> Cancelable?
}
