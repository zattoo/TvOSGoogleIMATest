//
//  ZattooEasycastRepository.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 06.12.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ZattooEasycastRepository: EasycastRepository {

    private let networkDataSource: EasycastNetworkDataSource

    // MARK: - Initializers

    init(networkDataSource: EasycastNetworkDataSource = ZattooEasycastNetworkDataSource()) {
        self.networkDataSource = networkDataSource
    }

    @discardableResult
    func listReceiver(success: @escaping ([EasycastReceiverModel]) -> Void,
                      failure: @escaping (ErrorModel) -> Void) -> Cancelable? {

        return networkDataSource.listReceiver(success: { success($0.models) }, failure: { failure($0.model) })
    }
}
