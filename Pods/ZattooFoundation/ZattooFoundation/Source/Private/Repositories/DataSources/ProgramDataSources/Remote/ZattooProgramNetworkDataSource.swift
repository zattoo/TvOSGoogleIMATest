//
//  ZattooProgramNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 25.09.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire


struct ZattooProgramNetworkDataSource: ProgramNetworkDataSource {
    
    private let manager: SessionManager
    
    init(manager: SessionManager = SessionManager.shared) {
        self.manager = manager
    }
    
    @discardableResult
    func search(_ query: String,
                timeframe: ProgramSearchTimeframe,
                success: @escaping ([ProgramEntity]) -> Void,
                failure: @escaping (NetworkEntityError) -> Void) -> Cancelable? {
        
        var parameters = ["query" : query]
        
        if timeframe != .all {
            parameters["time"] = timeframe.parameter
        }
        
        return manager.request(endpoint: .programSearch, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooProgramSearchResponse>) in
            
            switch result {
            case .success(let searchResult):
                success(searchResult.programs)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
            }.task
    }
}

extension ProgramSearchTimeframe {
    var parameter: String {
        switch self {
        case .all:
            return ""
        case .past:
            return "l"
        case .upcoming:
            return "g"
        case .live:
            return "e"
        }
    }
}
