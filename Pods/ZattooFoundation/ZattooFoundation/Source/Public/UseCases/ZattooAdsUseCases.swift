//
//  ZattooAdsUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.04.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


public struct ZattooAdsUseCases: AdsUseCases {

    private let adsRepository: AdsRepository

    // MARK: - Initializers

    public init() {
        self.init(adsRepository: ZattooAdsRepository())
    }

    init(adsRepository: AdsRepository) {
        self.adsRepository = adsRepository
    }

    // MARK: - AdsUseCases

    public func fetchAdWith(style: AdStyle,
                     success: @escaping (DisplayAd) -> Void,
                     failure: @escaping (Error) -> Void) {

        adsRepository.fetchAdWith(
            style: style,
            success: { success($0.DTO) },
            failure: { failure($0.DTO) })
    }

    public func fetchAdWith(path: String,
                     success: @escaping (DisplayAd) -> Void,
                     failure: @escaping (Error) -> Void) {

        adsRepository.fetchAdWith(
            path: path,
            success: { success($0.DTO) },
            failure: { failure($0.DTO) })
    }

    public func adCompleted(success: @escaping () -> Void) {
        adsRepository.adCompleted(success: success)
    }
}
