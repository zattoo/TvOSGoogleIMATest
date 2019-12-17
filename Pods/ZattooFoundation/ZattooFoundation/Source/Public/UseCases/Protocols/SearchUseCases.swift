//
//  SearchUseCases.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 7/12/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation

@objc public enum ProgramSearchTimeframe: Int {
    case past
    case live
    case upcoming
    case all
}

@objc public protocol SearchUseCases {
    
    @objc
    func searchAvodVideos(query: String,
                          success: @escaping ([AvodVideo]) -> Void,
                          failure: @escaping (Error) -> Void)
    
    @objc
    func searchChannels(query: String,
                        success: @escaping ([Channel]) -> Void,
                        failure: @escaping (Error) -> Void)
    
    @objc
    func searchRecordings(query: String,
                          success: @escaping ([Recording]) -> Void,
                          failure: @escaping (Error) -> Void)
    
    @objc
    func searchPrograms(query: String,
                        timeframe: ProgramSearchTimeframe,
                        success: @escaping ([Program]) -> Void,
                        failure: @escaping (Error) -> Void)
    
    func searchVod(query: String,
                   success: @escaping (VodSearchResult) -> Void,
                   failure: @escaping (Error) -> Void)
}
