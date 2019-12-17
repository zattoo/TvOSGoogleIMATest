//
//  ZattooSessionNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/24/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire


struct ZattooSessionNetworkDataSource: SessionNetworkDataSource {
    
    private let manager: SessionManager
    private let configuration: Configuration
    private let cookiesManager: CookiesManager

    init(manager: SessionManager = SessionManager.shared,
         configuration: Configuration = ZattooConfiguration.shared,
         cookiesManager: CookiesManager = ZattooCookiesManager()) {
        
        self.manager = manager
        self.configuration = configuration
        self.cookiesManager = cookiesManager
    }
    
    func session(success: @escaping (SessionEntity) -> Void,
                 failure: @escaping (NetworkEntityError) -> Void) {

        manager.request(endpoint: .session).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooSessionResponse>) in

            self.cookiesManager.saveSessionCookie()
            switch result {
            case .success(let sessionResponse):
                success(sessionResponse.session)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    func hello(success: @escaping (SessionEntity) -> Void,
               failure: @escaping (NetworkEntityError) -> Void) {
        
        manager.request(endpoint: .hello, parameters: self.helloParameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooSessionResponse>) in

            self.cookiesManager.saveSessionCookie()
            switch result {
            case .success(let sessionResponse):
                success(sessionResponse.session)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    func publishPartner(with partnerId: PartnerId) {
        let parameters = ["partner" : partnerId]
        manager.request(endpoint: .publishPartner, parameters: parameters)
    }
    
    func track(_ urls: [(event: String, url: URL)]) {
        let trackingUrls = urls.filter { $0.event == "startup" }.map { $0.url }
        self.manager.fire(trackingUrls)
    }
    
    // MARK: - Private
    
    private var helloParameters: [String: String] {
        
        var parameters = ["format"         : "json",
                          "uuid"           : configuration.uuid,
                          "device_type"    : configuration.deviceType]
        
        
        parameters["app_tid"] = configuration.appIdentifier
        parameters["lang"] = configuration.languageCode
        parameters["app_version"] = configuration.appVersion
        parameters["bundle_id"] = configuration.bundleId
        parameters["dsia"] = configuration.advertisingIdentifier
        parameters["shop_environment"] = configuration.shopEnvironment
        parameters["keep_lang"] = "True"

        return parameters
    }
}
