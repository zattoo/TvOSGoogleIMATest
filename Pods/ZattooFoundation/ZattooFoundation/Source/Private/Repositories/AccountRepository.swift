//
//  AccountRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol AccountRepository {
    
    func login(username: String,
               password: String,
               success: @escaping (SessionModel) -> Void,
               failure: @escaping (ErrorModel) -> Void)
    
    func loginWithFacebook(accessToken: String,
                           subscribeToNewsletter: Bool,
                           success: @escaping (SessionModel) -> Void,
                           failure: @escaping (ErrorModel) -> Void)
    
    func loginWithGoogle(accessToken: String,
                         subscribeToNewsletter: Bool, 
                         success: @escaping (SessionModel) -> Void,
                         failure: @escaping (ErrorModel) -> Void)
    
    func loginWith(externalToken token: String,
                   success: @escaping (SessionModel) -> Void,
                   failure: @escaping (ErrorModel) -> Void)
    
    func logout(success: @escaping (SessionModel) -> Void,
                failure: @escaping (ErrorModel, SessionModel?) -> Void)
    
    func forgotPassword(username: String,
                        success: @escaping () -> Void,
                        failure: @escaping (ErrorModel) -> Void)
    
    func register(username: String,
                  password: String,
                  success: @escaping (SessionModel) -> Void,
                  failure: @escaping (ErrorModel) -> Void)
    
    func zuyaToken(success: @escaping (String) -> Void,
                   failure: @escaping (ErrorModel) -> Void)

    func consents(success: @escaping ([ConsentModel]) -> Void,
                  failure: @escaping (ErrorModel) -> Void)

    func updateConsent(identifier: String,
                       value: Bool,
                       success: @escaping () -> Void,
                       failure: @escaping (ErrorModel) -> Void)
}
