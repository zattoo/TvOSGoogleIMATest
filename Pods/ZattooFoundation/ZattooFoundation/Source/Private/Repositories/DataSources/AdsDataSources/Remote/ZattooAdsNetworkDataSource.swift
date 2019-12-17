//
//  ZattooAdsNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.04.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire


struct ZattooAdsNetworkDataSource: AdsNetworkDataSource {

    private let manager: SessionManager

    init(manager: SessionManager = SessionManager.shared) {
        self.manager = manager
    }

    // MARK: - AdsNetworkDataSource

    func fetchAdWith(style: AdStyle,
                     success: @escaping (DisplayAdEntity) -> Void,
                     failure: @escaping (NetworkEntityError) -> Void) {

        let parameters = adsParametersFor(style: style)
        manager.request(endpoint: .adDisplay, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooDisplayAdResponse>) in

            self.handleResult(result, success: success, failure: failure)
        }
    }

    func fetchAdWith(path: String,
                     success: @escaping (DisplayAdEntity) -> Void,
                     failure: @escaping (NetworkEntityError) -> Void) {

        let route = Router(path, configuration: ZattooConfiguration.shared, isPathPrefixRequired: false)
        manager.request(route).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooDisplayAdResponse>) in

            self.handleResult(result, success: success, failure: failure)
        }
    }

    func adCompleted(success: @escaping () -> Void) {
        manager.request(endpoint: .adCompleted).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooResponse>) in

            if result.isSuccess {
                success()
            }
        }
    }

    // MARK: - Private

    private func adsParametersFor(style: AdStyle) -> [String: Any] {

        switch style {
        case .brandingDay:
            return ["ad_style": "branding_day"]
        case .mobileBanner:
            return ["ad_style": "mb"]
        case .mobileBillboard:
            return ["ad_style": "mobile-billboard"]
        case .mobileMediumRect:
            return ["ad_style": "mobile-medrect"]
        case .prestitial:
            return ["ad_style": "prestitial"]
        case .tvsa(let channelId):
            return ["ad_style": "tvsa", "cid": channelId]
        }
    }

    private func handleResult(_ result: Result<ZattooDisplayAdResponse>,
                              success: @escaping (DisplayAdEntity) -> Void,
                              failure: @escaping (NetworkEntityError) -> Void) {

        switch result {
        case .success(let displayAdResponse):
            guard let displayAd = displayAdResponse.displayAd else { return }
            success(displayAd)
        case .failure(let errorEntity):
            guard let errorEntity = errorEntity as? NetworkEntityError else { return }
            failure(errorEntity)
        }
    }
}
