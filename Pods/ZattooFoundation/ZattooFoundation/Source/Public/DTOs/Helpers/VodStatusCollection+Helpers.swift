//
//  VodStatusCollection+Helpers.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/25/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


public extension VodStatusCollection {

    func playbackStatus(for vod: Vod) -> VodPlaybackStatus? {
        guard let vodStatus = vodStatus(for: vod) else { return nil }
        return VodPlaybackStatus(
            lastPosition: vodStatus.lastPosition,
            vodType: vodStatus.vodType
        )
    }

    func orderedStatus(for vod: Vod) -> VodStatus? {
        guard let vodStatus = vodStatus(for: vod), vodStatus.isOrdered else { return nil }
        return vodStatus
    }
    
    func orderedState(for vod: Vod) -> VodStatusOrderedState? {
        if let vodStatus = orderedStatus(for: vod) {
            return vodStatus.orderedState
        }

        let svodTerms = vod.svodTerms
        if !svodTerms.isEmpty {
            for term in vod.svodTerms {
                let now = Date()
                if let subscriptionSku = term.subscriptionSku,
                    let _ = subscriptions[subscriptionSku],
                    term.publishedFrom <= now,
                    term.publishedUntil > now {
                    return .subscribed(sku: subscriptionSku, name: term.subscriptionName)
                }
            }
            return .notSubscribed(name: svodTerms.first?.subscriptionName, isSubscriptionOnly: vod.hasOnlySvodTerms)
        }

        guard let vodSeason = vod as? VodSeason else { return nil }

        let orderedState: VodStatusOrderedState?
        if vodSeason.episodes.isEmpty {
            orderedState = .error(.seasonHasNoEpisodes)
        }
        else if areAllEpisodesPurchased(of: vodSeason) {
            orderedState = .purchased
        } else {
            orderedState = nil
        }
        return orderedState
    }
    
    func progress(for vod: Vod) -> Float? {
        if case .notSubscribed? = orderedState(for: vod) {
            return nil
        }

        guard let vodStatus = vodStatus(for: vod),
            let duration = vod.duration else { return nil }
        return vodStatus.progress(duration: duration)
    }
    
    // MARK: - Private
    
    private subscript(_ teasableType: TeasableType) -> VodStatusDictionary? {
        return statuses[teasableType]
    }
    
    private func areAllEpisodesPurchased(of vodSeason: VodSeason) -> Bool {
        for episode in vodSeason.episodes {
            switch orderedState(for: episode) {
            case .some(.rented),
                 .some(.purchased):
                continue
            default:
                return false
            }
        }
        return true
    }

    private func vodStatus(for vod: Vod) -> VodStatus? {
        return self[vod.teasableType]?[vod.id]
    }
}

private extension VodSubscriptions {

    subscript(_ key: String) -> VodSubscription? {
        return subscriptions[key]
    }
}
