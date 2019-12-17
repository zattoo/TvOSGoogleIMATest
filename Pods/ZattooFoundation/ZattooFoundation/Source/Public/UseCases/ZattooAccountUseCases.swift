//
//  ZattooAccountUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class ZattooAccountUseCases: NSObject, AccountUseCases {

    private let sessionRepository: SessionRepository
    private let favoritesRepository: FavoritesRepository
    private let accountRepository: AccountRepository
    private let channelListRepository: ChannelListRepository
    private let settingsRepository: SettingsRepository
    private let recordingsRepository: RecordingsRepository
    private let vodRepository: VodRepository
    private let cookiesManager: CookiesManager
    
    // MARK: - Initializers
    
    convenience public override init() {
        self.init(sessionRepository: ZattooSessionRepository(),
                  favoritesRepository: ZattooFavoritesRepository(),
                  accountRepository: ZattooAccountRepository(),
                  channelListRepository: ZattooChannelListRepository(),
                  settingsRepository: ZattooSettingsRepository(),
                  recordingsRepository: ZattooRecordingsRepository(),
                  vodRepository: ZattooVodRepository(),
                  cookiesManager: ZattooCookiesManager())
    }
    
    init(sessionRepository: SessionRepository,
         favoritesRepository: FavoritesRepository,
         accountRepository: AccountRepository,
         channelListRepository: ChannelListRepository,
         settingsRepository: SettingsRepository,
         recordingsRepository: RecordingsRepository,
         vodRepository: VodRepository,
         cookiesManager: CookiesManager) {

        self.sessionRepository = sessionRepository
        self.favoritesRepository = favoritesRepository
        self.accountRepository = accountRepository
        self.channelListRepository = channelListRepository
        self.settingsRepository = settingsRepository
        self.recordingsRepository = recordingsRepository
        self.vodRepository = vodRepository
        self.cookiesManager = cookiesManager
        
        super.init()
    }
    
    // MARK: - Public
    
    @objc
    public func login(username: String,
                      password: String,
                      success: @escaping (Session) -> Void,
                      failure: @escaping (Error) -> Void) {
        
        guard !username.isEmpty else {
            return failure(Error(code: .usernameIsEmpty))
        }
        
        guard !password.isEmpty else {
            return failure(Error(code: .passwordIsEmpty))
        }
        
        accountRepository.login(username: username,
                                password: password,
                                success: { success($0.DTO) },
                                failure: { failure($0.DTO) })
    }
    
    @objc
    public func loginWithFacebook(accessToken: String,
                                  subscribeToNewsletter: Bool,
                                  success: @escaping (Session) -> Void,
                                  failure: @escaping (Error) -> Void) {
        
        accountRepository.loginWithFacebook(accessToken: accessToken,
                                            subscribeToNewsletter: subscribeToNewsletter,
                                            success: { success($0.DTO) },
                                            failure: { failure($0.DTO) })
    }
    
    @objc
    public func loginWithGoogle(accessToken: String,
                                subscribeToNewsletter: Bool,
                                success: @escaping (Session) -> Void,
                                failure: @escaping (Error) -> Void) {
        
        accountRepository.loginWithGoogle(accessToken: accessToken,
                                          subscribeToNewsletter: subscribeToNewsletter,
                                          success: { success($0.DTO) },
                                          failure: { failure($0.DTO) })
    }
    
    @objc
    public func loginWith(externalToken token: String,
                   success: @escaping (Session) -> Void,
                   failure: @escaping (Error) -> Void) {
        accountRepository.loginWith(externalToken: token,
                                    success: { success($0.DTO) },
                                    failure: { failure($0.DTO) })
    }
    
    @objc
    public func logout(success: @escaping (Session) -> Void,
                       failure: @escaping (Error) -> Void) {

        sessionRepository.session(success: { [weak self] session in
            self?.accountRepository.logout(
                success: {
                    [weak self] session in
                    self?.clearCaches(shopUrl: session.shopUrl) {
                        success(session.DTO)
                    }
                }, failure: {
                    [weak self] error, session in
                    self?.clearCaches(shopUrl: session?.shopUrl, completion: {
                        failure(error.DTO)
                    })
            })
        }, failure: { error in
            failure(error.DTO)
        })
    }
    
    @objc
    public func forgotPassword(username: String,
                               success: @escaping () -> Void,
                               failure: @escaping (Error) -> Void) {
        
        guard !username.isEmpty else {
            return failure(Error(code: .usernameIsEmpty))
        }
        
        accountRepository.forgotPassword(
            username: username,
            success: success,
            failure: { failure($0.DTO) })
    }
    
    @objc
    public func register(username: String,
                         password: String,
                         success: @escaping (Session) -> Void,
                         failure: @escaping (Error) -> Void) {
        
        accountRepository.register(username: username,
                                   password: password,
                                   success: { success($0.DTO) },
                                   failure: { failure($0.DTO) })
    }
    
    @objc
    public func zuyaToken(success: @escaping (String) -> Void,
                          failure: @escaping (Error) -> Void) {
        
        accountRepository.zuyaToken(success: success,
                                    failure: { failure($0.DTO) })
    }

    @objc
    public func consents(success: @escaping ([Consent]) -> Void,
                         failure: @escaping (Error) -> Void) {

        accountRepository.consents(success: {
            consents in
            success(consents.map({ $0.DTO }))
        }, failure: { failure($0.DTO) })
    }

    @objc
    public func requiredConsents(success: @escaping ([Consent]) -> Void,
                         failure: @escaping (Error) -> Void) {

        sessionRepository.refreshSession(success: {
            [weak self] session in
            if !session.consentsRequired.isEmpty {
                self?.accountRepository.consents(success: {
                    consents in
                    let filteredConsents = consents.filter({ session.consentsRequired.contains($0.id) && $0.value == nil })
                    success(filteredConsents.map({ $0.DTO }))
                }, failure: { failure($0.DTO) })
            } else {
                success([])
            }
            }, failure: { failure($0.DTO) })
    }

    @objc
    public func updateConsent(identifier: String,
                              value: Bool,
                              success: @escaping () -> Void,
                              failure: @escaping (Error) -> Void) {

        accountRepository.updateConsent(identifier: identifier,
                                        value: value,
                                        success: success,
                                        failure: { failure($0.DTO) })
    }
    
    // MARK: - Private
    
    private func clearCaches(shopUrl: URL?, completion: @escaping () -> Void) {
        clearRepositoryCaches()
        cookiesManager.clearSessionCookie()
        guard let host = shopUrl?.host else { return completion() }
        cookiesManager.clearZrsSessionCookies(zrsHost: host, completion: completion)
    }

    private func clearRepositoryCaches() {
        channelListRepository.removeAll()
        favoritesRepository.removeAll()
        settingsRepository.removeAll()
        recordingsRepository.removeAll()
        vodRepository.removeAll()
        URLCache.shared.removeAllCachedResponses()
    }
}
