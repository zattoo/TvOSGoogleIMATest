//
//  ZattooAccountRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ZattooAccountRepository: AccountRepository {
    private let memoryDataSource: GenericMemoryDataSource<SessionEntity>
    private let localDataSource: GenericLocalDataSource<SessionEntity>
    private let networkDataSource: AccountNetworkDataSource
    
    // MARK: - Initializers
    
    init(memoryDataSource: GenericMemoryDataSource<SessionEntity> = SessionMemoryDataSource.shared,
         localDataSource: GenericLocalDataSource<SessionEntity> = SessionLocalDataSource.shared,
         networkDataSource: AccountNetworkDataSource = ZattooAccountNetworkDataSource()) {
        self.memoryDataSource = memoryDataSource
        self.localDataSource = localDataSource
        self.networkDataSource = networkDataSource
    }
    
    // MARK: - AccountRepository
    
    func login(username: String,
               password: String,
               success: @escaping (SessionModel) -> Void,
               failure: @escaping (ErrorModel) -> Void) {

        sessionNetworkOperationQueue.addOperation {
            let semaphore = DispatchSemaphore(value: 0)
            self.networkDataSource.login(
                username: username,
                password: password,
                success: {
                    sessionEntity in
                    self.memoryDataSource.save(sessionEntity)
                    self.localDataSource.save(sessionEntity)
                    GlobalMainQueue.async { success(sessionEntity.model) }
                    semaphore.signal()
            }, failure: {
                error in
                GlobalMainQueue.async { failure(error.model) }
                semaphore.signal()
            })
            semaphore.wait()
        }
    }
    
    func loginWithFacebook(accessToken: String,
                           subscribeToNewsletter: Bool,
                           success: @escaping (SessionModel) -> Void,
                           failure: @escaping (ErrorModel) -> Void) {

        sessionNetworkOperationQueue.addOperation {
            let semaphore = DispatchSemaphore(value: 0)
            self.networkDataSource.loginWithFacebook(
                accessToken: accessToken,
                subscribeToNewsletter: subscribeToNewsletter,
                success: {
                    sessionEntity in
                    self.memoryDataSource.save(sessionEntity)
                    self.localDataSource.save(sessionEntity)
                    GlobalMainQueue.async { success(sessionEntity.model) }
                    semaphore.signal()
            }, failure: {
                error in
                GlobalMainQueue.async { failure(error.model) }
                semaphore.signal()
            })
            semaphore.wait()
        }
    }
    
    func loginWithGoogle(accessToken: String,
                         subscribeToNewsletter: Bool,
                         success: @escaping (SessionModel) -> Void,
                         failure: @escaping (ErrorModel) -> Void) {

        sessionNetworkOperationQueue.addOperation {
            let semaphore = DispatchSemaphore(value: 0)
            self.networkDataSource.loginWithGoogle(
                accessToken: accessToken,
                subscribeToNewsletter: subscribeToNewsletter,
                success: {
                    sessionEntity in
                    self.memoryDataSource.save(sessionEntity)
                    self.localDataSource.save(sessionEntity)
                    GlobalMainQueue.async { success(sessionEntity.model) }
                    semaphore.signal()
            }, failure: {
                error in
                GlobalMainQueue.async { failure(error.model) }
                semaphore.signal()
            })
            semaphore.wait()
        }
    }
    
    func loginWith(externalToken token: String,
                   success: @escaping (SessionModel) -> Void,
                   failure: @escaping (ErrorModel) -> Void) {

        sessionNetworkOperationQueue.addOperation {
            let semaphore = DispatchSemaphore(value: 0)
            self.networkDataSource.loginWith(
                externalToken: token,
                success: {
                    sessionEntity in
                    self.memoryDataSource.save(sessionEntity)
                    self.localDataSource.save(sessionEntity)
                    GlobalMainQueue.async { success(sessionEntity.model) }
                    semaphore.signal()
            }, failure: {
                error in
                GlobalMainQueue.async { failure(error.model) }
                semaphore.signal()
            })
            semaphore.wait()
        }
    }
    
    func logout(success: @escaping (SessionModel) -> Void,
                failure: @escaping (ErrorModel, SessionModel?) -> Void) {

        sessionNetworkOperationQueue.addOperation {
            let semaphore = DispatchSemaphore(value: 0)
            self.networkDataSource.logout(
                success: {
                    sessionEntity in
                    self.memoryDataSource.save(sessionEntity)
                    self.localDataSource.save(sessionEntity)
                    GlobalMainQueue.async { success(sessionEntity.model) }
                    semaphore.signal()
            }, failure: {
                error in
                let entity = self.localDataSource.get()
                self.memoryDataSource.clear()
                self.localDataSource.clear()
                GlobalMainQueue.async { failure(error.model, entity?.model) }
                semaphore.signal()
            })
            semaphore.wait()
        }
    }
    
    func forgotPassword(username: String,
                        success: @escaping () -> Void,
                        failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.forgotPassword(username: username,
                                         success: success,
                                         failure: { failure($0.model) })
    }
    
    func register(username: String, password: String,
                  success: @escaping (SessionModel) -> Void,
                  failure: @escaping (ErrorModel) -> Void) {

        sessionNetworkOperationQueue.addOperation {
            let semaphore = DispatchSemaphore(value: 0)
            self.networkDataSource.register(
                username: username,
                password: password,
                success: {
                    sessionEntity in
                    self.memoryDataSource.save(sessionEntity)
                    self.localDataSource.save(sessionEntity)
                    GlobalMainQueue.async { success(sessionEntity.model) }
                    semaphore.signal()
            }, failure: {
                error in
                GlobalMainQueue.async { failure(error.model) }
                semaphore.signal()
            })
            semaphore.wait()
        }
    }
    
    func zuyaToken(success: @escaping (String) -> Void,
                   failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.zuyaToken(success: success,
                                    failure: { failure($0.model) })
    }

    func consents(success: @escaping ([ConsentModel]) -> Void,
                  failure: @escaping (ErrorModel) -> Void) {

        networkDataSource.consents(
            success: {
                consents in
                success(consents.map({ $0.model }))
        },
            failure: { failure($0.model) })
    }

    func updateConsent(identifier: String,
                       value: Bool,
                       success: @escaping () -> Void,
                       failure: @escaping (ErrorModel) -> Void) {

        networkDataSource.updateConsent(identifier: identifier,
                                        value: value,
                                        success: success,
                                        failure: { failure($0.model) })
    }
}
