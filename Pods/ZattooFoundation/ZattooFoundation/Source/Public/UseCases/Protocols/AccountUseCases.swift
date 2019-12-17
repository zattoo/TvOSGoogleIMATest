//
//  AccountUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc public protocol AccountUseCases {
    
    @objc
    func login(username: String,
               password: String,
               success: @escaping (Session) -> Void,
               failure: @escaping (Error) -> Void)
    
    @objc
    func loginWithFacebook(accessToken: String,
                           subscribeToNewsletter: Bool,
                           success: @escaping (Session) -> Void,
                           failure: @escaping (Error) -> Void)
    
    @objc
    func loginWithGoogle(accessToken: String,
                         subscribeToNewsletter: Bool,
                         success: @escaping (Session) -> Void,
                         failure: @escaping (Error) -> Void)
    
    @objc
    func loginWith(externalToken token: String,
                   success: @escaping (Session) -> Void,
                   failure: @escaping (Error) -> Void)
    
    @objc
    func logout(success: @escaping (Session) -> Void,
                failure: @escaping (Error) -> Void)
    
    @objc
    func forgotPassword(username: String,
                        success: @escaping () -> Void,
                        failure: @escaping (Error) -> Void)
    
    @objc
    func register(username: String,
                  password: String,
                  success: @escaping (Session) -> Void,
                  failure: @escaping (Error) -> Void)
    
    @objc
    func zuyaToken(success: @escaping (String) -> Void,
                   failure: @escaping (Error) -> Void)

    @objc
    func consents(success: @escaping ([Consent]) -> Void,
                  failure: @escaping (Error) -> Void)

    @objc
    func requiredConsents(success: @escaping ([Consent]) -> Void,
                          failure: @escaping (Error) -> Void)

    @objc
    func updateConsent(identifier: String,
                       value: Bool,
                       success: @escaping () -> Void,
                       failure: @escaping (Error) -> Void)

}
