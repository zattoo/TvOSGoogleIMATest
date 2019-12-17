//
//  ZattooVodRepository.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/26/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


private var vodStatusesNetworkOperationQueue: OperationQueue = {
    let queue = OperationQueue()
    queue.maxConcurrentOperationCount = 1
    return queue
}()

private var vodWatchListNetworkOperationQueue: OperationQueue = {
    let queue = OperationQueue()
    queue.maxConcurrentOperationCount = 1
    return queue
}()

struct ZattooVodRepository: VodRepository {

    private let networkDataSource: VodNetworkDataSource
    private let vodStatusesMemoryDataSource: GenericMemoryDataSource<VodStatusCollectionEntity>
    private let vodSubscriptionsMemoryDataSource: GenericMemoryDataSource<VodSubscriptionsEntity>
    private let vodWatchListMemoryDataSource: GenericMemoryDataSource<VodWatchListEntity>

    // MARK: - Initializers

    init(networkDataSource: VodNetworkDataSource = ZattooVodNetworkDataSource(),
         vodStatusesMemoryDataSource: GenericMemoryDataSource<VodStatusCollectionEntity> = ZattooVodStatusCollectionMemoryDataSource.shared,
         vodSubscriptionsMemoryDataSource: GenericMemoryDataSource<VodSubscriptionsEntity> = ZattooVodSubscriptionsMemoryDataSource.shared,
         vodWatchListMemoryDataSource: GenericMemoryDataSource<VodWatchListEntity> = ZattooVodWatchListMemoryDataSource.shared) {
        self.networkDataSource = networkDataSource
        self.vodStatusesMemoryDataSource = vodStatusesMemoryDataSource
        self.vodSubscriptionsMemoryDataSource = vodSubscriptionsMemoryDataSource
        self.vodWatchListMemoryDataSource = vodWatchListMemoryDataSource
    }

    // MARK: - VodRepository

    func vodStatuses(success: @escaping (VodStatusCollectionModel) -> Void, failure: @escaping (ErrorModel) -> Void) {

        vodStatusesNetworkOperationQueue.addOperation {
            let semaphore = DispatchSemaphore(value: 0)
            let dispatchGroup = DispatchGroup()
            var vodStatuses: VodStatusCollectionEntity?
            var vodSubscriptions: VodSubscriptionsEntity?
            var error = [NetworkEntityError]()

            self.fetchVodStatuses(
                with: dispatchGroup,
                success: { vodStatuses = $0 },
                failure: { error.append($0) })

            self.fetchVodSubscriptions(
                with: dispatchGroup,
                success: { vodSubscriptions = $0 },
                failure: { error.append($0) })

            dispatchGroup.notify(queue: .main) {
                semaphore.signal()

                if let vodStatuses = vodStatuses, let vodSubscriptions = vodSubscriptions {
                    success(vodStatuses.model(with: vodSubscriptions.model))
                }
                else if let error = error.last {
                    failure(error.model)
                }
            }

            semaphore.wait()
        }
    }
    
    func order(id: TeasableId,
               teasableType: TeasableTypeModel,
               token: String,
               success: @escaping (VodStatusModel) -> Void,
               failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.order(
            id: id,
            teasableType: teasableType.entity,
            token: token,
            success: {
                self.vodStatusesMemoryDataSource.clear()
                success($0.model)
        }, failure: { failure($0.model) })
    }
    
    func removeAll() {
        vodStatusesMemoryDataSource.clear()
        vodSubscriptionsMemoryDataSource.clear()
        vodWatchListMemoryDataSource.clear()
    }

    @discardableResult
    func search(pghash: String,
                query: String,
                success: @escaping (VodSearchResultModel) -> Void,
                failure: @escaping (ErrorModel) -> Void) -> Cancelable? {
        
        return networkDataSource.search(
            pghash: pghash,
            query: query,
            success: { success($0.model) },
            failure: { failure($0.model) })
    }
    
    func updateVodStatus(id: TeasableId,
                         teasableType: TeasableTypeModel,
                         position: TimeInterval?,
                         captionLanguageCode: String?,
                         audioLanguageCode: String?,
                         success: @escaping (VodStatusUpdateResultModel) -> Void,
                         failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.updateVodStatus(
            id: id,
            teasableType: teasableType.entity,
            position: position,
            captionLanguageCode: captionLanguageCode,
            audioLanguageCode: audioLanguageCode,
            success: {
                self.vodStatusesMemoryDataSource.clear()
                success($0.model)
        }, failure: { failure($0.model) })
    }

    func vodMovie(id: VodId,
                  success: @escaping (VodMovieModel) -> Void,
                  failure: @escaping (ErrorModel) -> Void) {

        networkDataSource.vodMovie(
            id: id,
            success: { success($0.model) },
            failure: { failure($0.model) })
    }
    
    func vodSeries(id: VodSeriesId,
                   season: VodId?,
                   success: @escaping (VodSeriesModel) -> Void,
                   failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.vodSeries(
            id: id,
            season: season,
            success: { success($0.model) },
            failure: { failure($0.model) })
    }

    func vodWatchList(success: @escaping (VodWatchListModel) -> Void,
                      failure: @escaping (ErrorModel) -> Void) {

        vodWatchListNetworkOperationQueue.addOperation {
            let semaphore = DispatchSemaphore(value: 0)

            if let entity = self.vodWatchListMemoryDataSource.get() {
                let model = entity.model
                return GlobalMainQueue.async { success(model) }
            }

            self.networkDataSource.vodWatchList(
                success: {
                    entity in
                    self.vodWatchListMemoryDataSource.save(entity)
                    let model = entity.model
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

    func vodWatchListAdd(id: TeasableId,
                         teasableType: TeasableTypeModel,
                         success: @escaping (VodWatchListModel) -> Void,
                         failure: @escaping (ErrorModel) -> Void) {

        vodWatchListNetworkOperationQueue.addOperation {
            let semaphore = DispatchSemaphore(value: 0)

            self.networkDataSource.vodWatchListAdd(
                id: id,
                teasableType: teasableType.entity,
                success: {
                    entity in
                    self.vodWatchListMemoryDataSource.save(entity)
                    let model = entity.model
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

    func vodWatchListRemove(id: TeasableId,
                            teasableType: TeasableTypeModel,
                            success: @escaping (VodWatchListModel) -> Void,
                            failure: @escaping (ErrorModel) -> Void) {

        vodWatchListNetworkOperationQueue.addOperation {
            let semaphore = DispatchSemaphore(value: 0)

            self.networkDataSource.vodWatchListRemove(
                id: id,
                teasableType: teasableType.entity,
                success: {
                    entity in
                    self.vodWatchListMemoryDataSource.save(entity)
                    let model = entity.model
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

    // MARK: - Private

    private func fetchVodStatuses(with dispatchGroup: DispatchGroup,
                                  success: @escaping (VodStatusCollectionEntity) -> Void,
                                  failure: @escaping (NetworkEntityError) -> Void) {

        if let entity = vodStatusesMemoryDataSource.get() {
            success(entity)
        }
        else {
            dispatchGroup.enter()
            networkDataSource.vodStatuses(
                success: {
                    entity in
                    self.vodStatusesMemoryDataSource.save(entity)
                    success(entity)
                    dispatchGroup.leave()
            }, failure: {
                error in
                failure(error)
                dispatchGroup.leave()
            })
        }
    }

    private func fetchVodSubscriptions(with dispatchGroup: DispatchGroup,
                                       success: @escaping (VodSubscriptionsEntity) -> Void,
                                       failure: @escaping (NetworkEntityError) -> Void) {

        if let entity = vodSubscriptionsMemoryDataSource.get() {
            success(entity)
        }
        else {
            dispatchGroup.enter()
            networkDataSource.vodSubscriptions(
                success: {
                    entity in
                    self.vodSubscriptionsMemoryDataSource.save(entity)
                    success(entity)
                    dispatchGroup.leave()
            }, failure: {
                error in
                failure(error)
                dispatchGroup.leave()
            })
        }
    }
}
