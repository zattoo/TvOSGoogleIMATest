//
//  ZattooEasycastNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 06.12.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire


struct ZattooEasycastNetworkDataSource: EasycastNetworkDataSource {

    private let manager: SessionManager

    init(manager: SessionManager = SessionManager.shared) {
        self.manager = manager
    }

    @discardableResult
    func listReceiver(success: @escaping ([EasycastReceiverEntity]) -> Void,
                      failure: @escaping (NetworkEntityError) -> Void) -> Cancelable? {

        return manager.request(endpoint: .castListReceiver).responseObject(errorEntity: NetworkEntityError.self) {
            (request, response, result: Result<ZattooCastListReceiverResponse>) in

            switch result {
            case .success(let result):
                success(result.castReceivers)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }.task
    }
}
