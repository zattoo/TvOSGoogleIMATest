//
//  ZattooSessionRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/24/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


var sessionNetworkOperationQueue: OperationQueue = {
    let queue = OperationQueue()
    queue.maxConcurrentOperationCount = 1
    return queue
}()

struct ZattooSessionRepository: SessionRepository {
    private var memoryDataSource: GenericMemoryDataSource<SessionEntity>
    private let localDataSource: GenericLocalDataSource<SessionEntity>
    private let networkDataSource: SessionNetworkDataSource
    
    init(memoryDataSource: GenericMemoryDataSource<SessionEntity> = SessionMemoryDataSource.shared,
         localDataSource: GenericLocalDataSource<SessionEntity> = SessionLocalDataSource.shared,
         networkDataSource: SessionNetworkDataSource = ZattooSessionNetworkDataSource()) {

        self.memoryDataSource = memoryDataSource
        self.localDataSource = localDataSource
        self.networkDataSource = networkDataSource
    }
    
    // MARK: - SessionRepository
    
    func session(success: @escaping (SessionModel) -> Void,
                 failure: @escaping (ErrorModel) -> Void) {

        sessionNetworkOperationQueue.addOperation {
            let semaphore = DispatchSemaphore(value: 0)

            if let entity = self.memoryDataSource.get() {
                let model = entity.model
                return GlobalMainQueue.async { success(model) }
            }

            if let entity = self.localDataSource.get() {
                self.memoryDataSource.save(entity)
                let model = entity.model
                return GlobalMainQueue.async { success(model) }
            }

            self.networkDataSource.session(
                success: {
                    entity in
                    self.memoryDataSource.save(entity)
                    self.localDataSource.save(entity)
                    let model = entity.model
                    GlobalMainQueue.async { success(model) }
                    semaphore.signal()
            }, failure: {
                error in
                let model = error.model
                GlobalMainQueue.async { failure(model) }
                semaphore.signal()
            })

            semaphore.wait()
        }
    }
    
    func refreshSession(success: @escaping (SessionModel) -> Void,
                        failure: @escaping (ErrorModel) -> Void) {
        removeAll()
        session(success: success, failure: failure)
    }
    
    func hello(success: @escaping (SessionModel) -> Void,
               failure: @escaping (ErrorModel) -> Void) {

        removeAll()
        sessionNetworkOperationQueue.addOperation {
            let semaphore = DispatchSemaphore(value: 0)
            self.networkDataSource.hello(
                success: {
                    entity in
                    self.memoryDataSource.save(entity)
                    self.localDataSource.save(entity)
                    let model = entity.model
                    GlobalMainQueue.async { success(model) }
                    semaphore.signal()
            }, failure: {
                error in
                let model = error.model
                GlobalMainQueue.async { failure(model) }
                semaphore.signal()
            })

            semaphore.wait()
        }
    }
    
    func publishPartner(with partnerId: PartnerId) {
        networkDataSource.publishPartner(with: partnerId)
    }
    
    func track(_ urls: [(event: String, url: URL)]) {
        networkDataSource.track(urls)
    }

    // MARK: - Private

    private func removeAll() {
        memoryDataSource.clear()
        localDataSource.clear()
    }
}
