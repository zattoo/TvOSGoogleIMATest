//
//  ZattooChannelListRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 4/18/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


private var networkOperationQueue: OperationQueue = {
    let queue = OperationQueue()
    queue.maxConcurrentOperationCount = 1
    return queue
}()

struct ZattooChannelListRepository: ChannelListRepository {
    private let memoryDataSource: GenericMemoryDataSource<[ChannelGroupEntity]>
    private let localDataSource: GenericLocalDataSource<[ChannelGroupEntity]>
    private let networkDataSource: ChannelListNetworkDataSource
    
    // MARK: - Initializers
    
    init(memoryDataSource: GenericMemoryDataSource<[ChannelGroupEntity]> = ChannelListMemoryDataSource.shared,
         localDataSource: GenericLocalDataSource<[ChannelGroupEntity]> = ChannelListLocalDataSource.shared,
         networkDataSource: ChannelListNetworkDataSource = ZattooChannelListNetworkDataSource()) {
        
        self.memoryDataSource = memoryDataSource
        self.localDataSource = localDataSource
        self.networkDataSource = networkDataSource
    }
    
    // MARK: - ChannelListRepository

    func fetch(pghash: String,
               success: @escaping ([ChannelGroupModel]) -> Void,
               failure: @escaping (ErrorModel) -> Void) {

        networkOperationQueue.addOperation {
            let semaphore = DispatchSemaphore(value: 0)

            if let entity = self.memoryDataSource.get(), !entity.isEmpty {
                let model = entity.map { $0.model }
                return GlobalMainQueue.async { success(model) }
            }

            if let entity = self.localDataSource.get(), !entity.isEmpty {
                self.memoryDataSource.save(entity)
                let model = entity.map { $0.model }
                return GlobalMainQueue.async { success(model) }
            }

            self.networkDataSource.channelList(
                pghash: pghash,
                success: {
                    entity in
                    self.memoryDataSource.save(entity)
                    self.localDataSource.save(entity)
                    let model = entity.map { $0.model }
                    GlobalMainQueue.async { success(model) }
                    semaphore.signal()
            }, failure: {
                error in
                GlobalMainQueue.async { failure(error.model) }
                semaphore.signal()
            })

            semaphore.wait()
        }
    }
    
    func refresh(pghash: String,
                 success: @escaping ([ChannelGroupModel]) -> Void,
                 failure: @escaping (ErrorModel) -> Void) {

        removeAll()
        fetch(pghash: pghash, success: success, failure: failure)
    }
    
    func removeAll() {
        memoryDataSource.clear()
        localDataSource.clear()
    }
}
