//
//  ZattooLifeCycleUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/24/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class ZattooLifeCycleUseCases: NSObject, LifeCycleUseCases {
    
    private let sessionRepository: SessionRepository
    private let recordingsRepository: RecordingsRepository
    private let favoritesRepository: FavoritesRepository
    private let channelListRepository: ChannelListRepository
    private let vodRepository: VodRepository

    // MARK: - Initializers
    
    convenience public override init() {
        self.init(
            sessionRepository: ZattooSessionRepository(),
            recordingsRepository: ZattooRecordingsRepository(),
            favoritesRepository: ZattooFavoritesRepository(),
            channelListRepository: ZattooChannelListRepository(),
            vodRepository: ZattooVodRepository()
        )
    }
    
    init(sessionRepository: SessionRepository,
         recordingsRepository: RecordingsRepository,
         favoritesRepository: FavoritesRepository,
         channelListRepository: ChannelListRepository,
         vodRepository: VodRepository) {
        self.sessionRepository = sessionRepository
        self.recordingsRepository = recordingsRepository
        self.favoritesRepository = favoritesRepository
        self.channelListRepository = channelListRepository
        self.vodRepository = vodRepository
        super.init()
    }
    
    // MARK: - Public
    
    @objc
    public func hello(success: @escaping (Session) -> Void,
                      failure: @escaping (Error) -> Void) {
        
        sessionRepository.hello(
            success: {
                [weak self] sessionModel in
                self?.clearRepositoryCaches()
                success(sessionModel.DTO)
                self?.sessionRepository.track(sessionModel.trackingUrls)
            },
            failure: { failure($0.DTO) })
    }
    
    @objc
    public func applicationDidReceiveMemoryWarning() {
        URLCache.shared.removeAllCachedResponses()
    }

    @objc
    public func applicationWillEnterForeground() {
        recordingsRepository.removeAll()
        vodRepository.removeAll()
    }

    // MARK: - Private

    private func clearRepositoryCaches() {
        channelListRepository.removeAll()
        favoritesRepository.removeAll()
        recordingsRepository.removeAll()
        vodRepository.removeAll()
    }
}
