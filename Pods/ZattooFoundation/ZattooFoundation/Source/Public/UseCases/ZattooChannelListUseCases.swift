//
//  ZattooChannelListUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 4/14/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


private let channelListTypeKey = "channelListType"

final public class ZattooChannelListUseCases: NSObject, ChannelListUseCases {
    
    private let sessionRepository: SessionRepository
    private let channelListRepository: ChannelListRepository
    private let settingsRepository: SettingsRepository
    private let favoritesRepository: FavoritesRepository
    
    // MARK: - Initializers
    
    convenience public override init() {
        self.init(sessionRepository: ZattooSessionRepository(),
                  channelListRepository: ZattooChannelListRepository(),
                  settingsRepository: ZattooSettingsRepository(),
                  favoritesRepository: ZattooFavoritesRepository())
    }
    
    init(sessionRepository: SessionRepository, channelListRepository: ChannelListRepository, settingsRepository: SettingsRepository, favoritesRepository: FavoritesRepository) {
        self.sessionRepository = sessionRepository
        self.channelListRepository = channelListRepository
        self.settingsRepository = settingsRepository
        self.favoritesRepository = favoritesRepository
        super.init()
    }
    
    // MARK: - Public
    
    @objc
    public func channel(withId channelId: ChannelId,
                 success: @escaping (Channel) -> Void,
                 failure: @escaping (Error) -> Void) {
  
        channelList(
            success: {
                channels in
                if let channel = channels.lazy.filter({ $0.cid == channelId }).first {
                    success(channel)
                }
                else {
                    failure(Error(code: .invalidChannelId))
                }
            },
            failure: failure
        )
    }
    
    @objc
    public func channelListGroupBySections(success: @escaping ([ChannelGroup]) -> Void, failure: @escaping (Error) -> Void) {
        sessionRepository.session(
            success: {
                [weak self] session in
                
                self?.channelListRepository.fetch(
                    pghash: session.pghash,
                    success: {
                        channelGroupModels in
                        success(channelGroupModels.map { $0.DTO })
                    },
                    failure: { failure($0.DTO) })
        },
            failure: { failure ($0.DTO) }
        )
    }
    
    @objc
    public func refreshChannelListGroupBySections(success: @escaping ([ChannelGroup]) -> Void,
                                                  failure: @escaping (Error) -> Void) {
        sessionRepository.session(
            success: {
                [weak self] session in
                
                self?.channelListRepository.refresh(
                    pghash: session.pghash,
                    success: {
                        channelGroupModels in
                        success(channelGroupModels.map { $0.DTO })
                    },
                    failure: { failure($0.DTO) })
        },
            failure: { failure ($0.DTO) })
    }
    
    @objc
    public func channelListType(success: @escaping (ChannelListType) -> Void,
                                failure: @escaping (Error) -> Void) {
        
        settingsRepository.value(
            forKey: channelListTypeKey,
            success: {
                [weak self] settingsValue in
                
                switch settingsValue {
                case .none:
                    success(.all)
                case let settingsValue as Int:
                    success(ChannelListType(rawValue: settingsValue) ?? .all)
                default:
                    self?.settingsRepository.removeAll()
                    success(.all)
                }
                
            },
            failure: { failure ($0.DTO) })
    }
    
    @objc
    public func update(channelListType: ChannelListType,
                       success: @escaping () -> Void,
                       failure: @escaping (Error) -> Void) {
        
        settingsRepository.save(
            value: channelListType.rawValue,
            forKey: channelListTypeKey,
            success: { success() },
            failure: { failure ($0.DTO) })
    }
    
    @objc
    public func channelList(withType type: ChannelListType,
                            success: @escaping ([Channel]) -> Void,
                            failure: @escaping (Error) -> Void) {
        
        switch type {
        case .all, .categories:
            return channelList(success: success, failure: failure)
        case .favorites:
            return favoriteChannels(success: success, failure: failure)
        }
    }
    
    @objc
    public func refreshChannelList(withType type: ChannelListType,
                                   success: @escaping ([Channel]) -> Void,
                                   failure: @escaping (Error) -> Void) {
        
        switch type {
        case .all, .categories:
            refreshChannelList(success: success, failure: failure)
        default:
            refreshFavoriteChannels(success: success, failure: failure)
        }
    }
    
    // MARK: Private
    
    private func channelList(success: @escaping ([Channel]) -> Void, failure: @escaping (Error) -> Void) {
        sessionRepository.session(
            success: {
                [weak self] session in
                
                self?.channelListRepository.fetch(
                    pghash: session.pghash,
                    success: {
                        channelGroupModels in
                        let channelListGroups = channelGroupModels.map { $0.DTO }
                        success(channelListGroups.flatMap { $0.channels })
                    },
                    failure: { failure($0.DTO) })
        },
            failure: { failure ($0.DTO) }
        )
    }
    
    private func refreshChannelList(success: @escaping ([Channel]) -> Void, failure: @escaping (Error) -> Void) {
        sessionRepository.refreshSession(
            success: {
                [weak self] session in
                
                self?.channelListRepository.refresh(
                    pghash: session.pghash,
                    success: {
                        channelGroupModels in
                        let channelListGroups = channelGroupModels.map { $0.DTO }
                        success(channelListGroups.flatMap { $0.channels })
                },
                    failure: { failure($0.DTO) })
        },
            failure: { failure ($0.DTO) }
        )
    }
    
    private func favoriteChannels(success: @escaping ([Channel]) -> Void, failure: @escaping (Error) -> Void) {
        favoritesRepository.refresh(
            success: {
                [weak self] favorites in
                self?.channelList(
                    success: {
                        channels in
                        let favoriteChannels = channels.filterAndSort(by: favorites)
                        success(favoriteChannels)
                }, failure: { failure($0) })
        },
            failure: { failure($0.DTO) })
    }
    
    private func refreshFavoriteChannels(success: @escaping ([Channel]) -> Void, failure: @escaping (Error) -> Void) {
        favoritesRepository.refresh(
            success: {
                favorites in
                self.refreshChannelList(
                    success: {
                        channels in
                        let favoriteChannels = channels.filterAndSort(by: favorites)
                        success(favoriteChannels)
                        
                }, failure: { failure($0) })
        },
            failure: { failure($0.DTO) })
    }
}

private extension Sequence where Iterator.Element: Channel {
    
    func filterAndSort(by channelIds: [ChannelId]) -> [Iterator.Element] {
        let filteredChannels = filter { channelIds.contains($0.cid) }
        let filteredAndSortedChannels = filteredChannels.sorted(by: increasingIndexOrder(of: channelIds))
        return filteredAndSortedChannels
    }
    
    private func increasingIndexOrder(of channelIds: [ChannelId]) -> (Channel, Channel) -> Bool {
        return {
            lhs, rhs in
            guard let lhsIndex = channelIds.index(of: lhs.cid),
                let rhsIndex = channelIds.index(of: rhs.cid) else { return false }
            return lhsIndex < rhsIndex
        }
    }
}
