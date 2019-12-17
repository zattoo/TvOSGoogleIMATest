//
//  ZattooAccountNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire


struct ZattooAccountNetworkDataSource: AccountNetworkDataSource {
    
    private let manager: SessionManager
    
    init(manager: SessionManager = SessionManager.shared) {
        self.manager = manager
    }
    
    func login(username: String, password: String, success: @escaping (SessionEntity) -> Void, failure: @escaping (NetworkEntityError) -> Void) {
        
        let parameters = ["login" : username, "password" : password, "remember" : "True"]
        
        manager.request(endpoint: .login, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooSessionResponse>) in
            
            switch result {
            case .success(let sessionResponse):
                success(sessionResponse.session)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    func loginWithFacebook(accessToken: String,
                           subscribeToNewsletter: Bool,
                           success: @escaping (SessionEntity) -> Void,
                           failure: @escaping (NetworkEntityError) -> Void) {
        
        let parameters = ssoParameters(accessToken: accessToken, subscribeToNewsletter: subscribeToNewsletter)
        
        manager.request(endpoint: .facebookSSO, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooSessionResponse>) in
            
            switch result {
            case .success(let sessionResponse):
                success(sessionResponse.session)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    func loginWithGoogle(accessToken: String,
                         subscribeToNewsletter: Bool,
                         success: @escaping (SessionEntity) -> Void,
                         failure: @escaping (NetworkEntityError) -> Void) {
        
        let parameters = ssoParameters(accessToken: accessToken, subscribeToNewsletter: subscribeToNewsletter)
        
        manager.request(endpoint: .googleSSO, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooSessionResponse>) in
            
            switch result {
            case .success(let sessionResponse):
                success(sessionResponse.session)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    func loginWith(externalToken token: String, success: @escaping (SessionEntity) -> Void, failure: @escaping (NetworkEntityError) -> Void) {
        
        let parameters = ["external_token" : token, "remember" : "True"]
        
        manager.request(endpoint: .login, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooSessionResponse>) in
            
            switch result {
            case .success(let sessionResponse):
                success(sessionResponse.session)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    func logout(success: @escaping (SessionEntity) -> Void, failure: @escaping (NetworkEntityError) -> Void) {
        manager.request(endpoint: .logout).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooSessionResponse>) in
            
            switch result {
            case .success(let sessionResponse):
                success(sessionResponse.session)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    func forgotPassword(username: String, success: @escaping () -> Void, failure: @escaping (NetworkEntityError) -> Void) {
        
        let parameters = ["login" : username]
        
        manager.request(endpoint: .forgotPassword, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooResponse>) in
            
            switch result {
            case .success:
                success()
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    func register(username: String, password: String, success: @escaping (SessionEntity) -> Void, failure: @escaping (NetworkEntityError) -> Void) {
        
        let parameters = ["login" : username, "password" : password, "remember" : "True"]
        
        manager.request(endpoint: .registerAccount, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooSessionResponse>) in
            
            switch result {
            case .success(let sessionResponse):
                success(sessionResponse.session)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    func zuyaToken(success: @escaping (String) -> Void,
                   failure: @escaping (NetworkEntityError) -> Void) {
    
        manager.request(endpoint: .zuyaToken).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooZuyaTokenResponse>) in
            
            switch result {
            case .success(let zuyaTokenResponse):
                success(zuyaTokenResponse.zuyaToken)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }

    func consents(success: @escaping ([ConsentEntity]) -> Void,
                  failure: @escaping (NetworkEntityError) -> Void) {

        manager.request(endpoint: .consents).responseObject(errorEntity: NetworkEntityError.self) {
            (request, response, result: Result<ZattooConsentsResponse>) in

            switch result {
            case .success(let consentsResponse):
                success(consentsResponse.consents)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }

    func updateConsent(identifier: String,
                       value: Bool,
                       success: @escaping () -> Void,
                       failure: @escaping (NetworkEntityError) -> Void) {

        let parameters: [String: Any] = ["consent": identifier,
                                         "value": value]

        manager.request(endpoint: .consentUpdate, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (request, response, result: Result<ZattooResponse>) in

            switch result {
            case .success:
                success()
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    // MARK: - Private
    
    private func ssoParameters(accessToken: String, subscribeToNewsletter: Bool) -> [String: Any] {
        return [
            "access_token": accessToken,
            "remember": "True",
            "sendalerts" : subscribeToNewsletter ? "1" : "0",
        ]
    }
}
