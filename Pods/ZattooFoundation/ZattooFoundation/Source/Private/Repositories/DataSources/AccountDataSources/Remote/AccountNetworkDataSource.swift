//
//  AccountNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol AccountNetworkDataSource {
    
    func login(username: String,
               password: String,
               success: @escaping (SessionEntity) -> Void,
               failure: @escaping (NetworkEntityError) -> Void)
    
    func loginWithFacebook(accessToken: String,
                           subscribeToNewsletter: Bool,
                           success: @escaping (SessionEntity) -> Void,
                           failure: @escaping (NetworkEntityError) -> Void)
    
    func loginWithGoogle(accessToken: String,
                         subscribeToNewsletter: Bool,
                         success: @escaping (SessionEntity) -> Void,
                         failure: @escaping (NetworkEntityError) -> Void)
    
    func loginWith(externalToken token: String,
                   success: @escaping (SessionEntity) -> Void,
                   failure: @escaping (NetworkEntityError) -> Void)
    
    func logout(success: @escaping (SessionEntity) -> Void,
                failure: @escaping (NetworkEntityError) -> Void)
    
    func forgotPassword(username: String,
                        success: @escaping () -> Void,
                        failure: @escaping (NetworkEntityError) -> Void)
    
    func register(username: String,
                  password: String,
                  success: @escaping (SessionEntity) -> Void,
                  failure: @escaping (NetworkEntityError) -> Void)
    
    func zuyaToken(success: @escaping (String) -> Void,
                   failure: @escaping (NetworkEntityError) -> Void)

    func consents(success: @escaping ([ConsentEntity]) -> Void,
                  failure: @escaping (NetworkEntityError) -> Void)

    func updateConsent(identifier: String,
                       value: Bool,
                       success: @escaping () -> Void,
                       failure: @escaping (NetworkEntityError) -> Void)

}
