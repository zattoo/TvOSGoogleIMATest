//
//  TeaserCollection.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/27/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


public typealias TeaserCollectionFilterQuery = [String: [String]]

@objc(ZattooFoundationTeaserCollection)
final public class TeaserCollection: NSObject {
    
    public internal (set) var teasers: [Teaser]
    public internal (set) var numTotal: Int
    public let title: String
    public let publicId: String
    public let pagePublicId: String?
    public let filters: [TeaserCollectionFilter]
    public let currentFilters: TeaserCollectionFilterQuery
    public let sortings: [TeaserCollectionSorting]
    public let currentSorting: String?
    public let subNavigationPublicId: String?
    public let displayManageRecordings: Bool
    public let ad: EditorialAd?
    public let logoToken: String?
    public let displayEmptyRecordings: Bool
    public let displayTotalRecordings: Bool
    public let navigationContext: EditorialNavigationContext?
    public let perPage: Int

    init(teasers: [Teaser],
         title: String,
         publicId: String,
         pagePublicId: String?,
         numTotal: Int,
         filters: [TeaserCollectionFilter],
         currentFilters: TeaserCollectionFilterQuery,
         sortings: [TeaserCollectionSorting],
         currentSorting: String?,
         subNavigationPublicId: String?,
         displayManageRecordings: Bool,
         ad: EditorialAd?,
         logoToken: String?,
         displayEmptyRecordings: Bool,
         displayTotalRecordings: Bool,
         navigationContext: EditorialNavigationContext?,
         perPage: Int) {

        self.publicId = publicId
        self.pagePublicId = pagePublicId
        self.teasers = teasers
        self.title = title
        self.numTotal = numTotal
        self.filters = filters
        self.currentFilters = currentFilters
        self.sortings = sortings
        self.currentSorting = currentSorting
        self.subNavigationPublicId = subNavigationPublicId
        self.displayEmptyRecordings = displayEmptyRecordings
        self.displayManageRecordings = displayManageRecordings
        self.ad = ad
        self.logoToken = logoToken
        self.displayTotalRecordings = displayTotalRecordings
        self.navigationContext = navigationContext
        self.perPage = perPage
    }
}

extension TeaserCollection {
    
    public func filterForFavorites(favorites: [ChannelId]) -> TeaserCollection {
        let filteredTeasers = teasers.filter { isInFavorites(teaser: $0, favorites: favorites) }
        return TeaserCollection(teasers: filteredTeasers, title: title, publicId: publicId, pagePublicId: pagePublicId, numTotal: filteredTeasers.count, filters: [], currentFilters: [:], sortings: [], currentSorting: nil, subNavigationPublicId: nil, displayManageRecordings: displayManageRecordings, ad: ad, logoToken: logoToken, displayEmptyRecordings: displayEmptyRecordings, displayTotalRecordings: displayTotalRecordings, navigationContext: navigationContext, perPage: perPage)
    }
    
    private func isInFavorites(teaser: Teaser, favorites: [ChannelId]) -> Bool {
        guard teaser.teasableType == .tvBroadcast else {
            return false
        }
        guard let cid = (teaser.teasable as? Program)?.cid else { return false }
        return favorites.contains(cid)
    }
}
