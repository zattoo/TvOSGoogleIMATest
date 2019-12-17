//
//  ZattooAdsRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.04.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ZattooAdsRepository: AdsRepository {
    private let networkDataSource: AdsNetworkDataSource

    // MARK: - Initializers

    init(networkDataSource: AdsNetworkDataSource = ZattooAdsNetworkDataSource()) {
        self.networkDataSource = networkDataSource
    }

    // MARK: - AdsRepository

    func fetchAdWith(style: AdStyle,
                     success: @escaping (DisplayAdModel) -> Void,
                     failure: @escaping (ErrorModel) -> Void) {

        networkDataSource.fetchAdWith(
            style: style,
            success: { success($0.model) },
            failure: { failure($0.model) })
    }

    func fetchAdWith(path: String,
                     success: @escaping (DisplayAdModel) -> Void,
                     failure: @escaping (ErrorModel) -> Void) {

        networkDataSource.fetchAdWith(
            path: path,
            success: { success($0.model) },
            failure: { failure($0.model) })
    }

    func adCompleted(success: @escaping () -> Void) {
        networkDataSource.adCompleted(success: success)
    }
}
