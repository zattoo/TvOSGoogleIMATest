//
//  ZattooRecallRepository.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 19.07.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ZattooRecallRepository: RecallRepository {

    private let networkDataSource: RecallNetworkDataSource

    // MARK: - Initializers

    init(networkDataSource: RecallNetworkDataSource = ZattooRecallNetworkDataSource()) {
        self.networkDataSource = networkDataSource
    }

    func enableRecall(success: @escaping () -> Void, failure: @escaping (ErrorModel) -> Void) {
        networkDataSource.enableRecall(success: { success() }, failure: { failure($0.model) })
    }
}
