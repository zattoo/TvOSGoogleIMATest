//
//  EditorialContentUseCases.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/27/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc public protocol EditorialContentUseCases {

    @objc
    func teaserCollection(zapiParams: [String: String],
                          zapiPath: String,
                          page: Int,
                          success: @escaping (TeaserCollection) -> Void,
                          failure: @escaping (Error) -> Void)

    @objc
    func teaserCollection(zapiParams: [String: String],
                          zapiPath: String,
                          page: Int,
                          sorting: String?,
                          filters: [String: [Any]]?,
                          success: @escaping (TeaserCollection) -> Void,
                          failure: @escaping (Error) -> Void)

    @objc
    func teaserCollection(contentId: String,
                          page: Int,
                          sorting: String?,
                          filters: [String: [Any]]?,
                          success: @escaping (TeaserCollection) -> Void,
                          failure: @escaping (Error) -> Void)
    
    @objc
    func topShelfTeaserCollection(publicId: String?,
                                  success: @escaping (TeaserCollection) -> Void,
                                  failure: @escaping (Error) -> Void)
    
    @objc
    func page(publicId: String,
              success: @escaping (Page) -> Void,
              failure: @escaping (Error) -> Void)

    @objc
    func subNavigations(publicId: String,
                        success: @escaping ([SubNavigationTab]) -> Void,
                        failure: @escaping (Error) -> Void)

    @objc
    func subNavigationsOfPage(publicId: String,
                              success: @escaping ([SubNavigationTab]) -> Void,
                              failure: @escaping (Error) -> Void)
}

public extension EditorialContentUseCases {

    func appendNextTeasers(to teaserCollection: TeaserCollection,
                           success: @escaping (TeaserCollection) -> Void,
                           failure: @escaping (Error) -> Void) {

        guard let nextPage = try? teaserCollection.nextPage(), let page = nextPage else { return }
        self.teaserCollection(
            contentId: teaserCollection.publicId,
            page: page,
            sorting: teaserCollection.currentSorting,
            filters: teaserCollection.currentFilters,
            success: {
                nextTeaserCollection in
                teaserCollection.teasers += nextTeaserCollection.teasers
                teaserCollection.numTotal = nextTeaserCollection.numTotal
                success(teaserCollection)
        }, failure: failure)
    }

    func refreshTeasers(for teaserCollection: TeaserCollection,
                        success: @escaping (TeaserCollection) -> Void,
                        failure: @escaping (Error) -> Void) {

        var teaserCollections = [Int: TeaserCollection]()
        var errors = [ZattooFoundation.Error]()
        let dispatchGroup = DispatchGroup()

        for page in 0...teaserCollection.currentPage {
            dispatchGroup.enter()
            self.teaserCollection(
                contentId: teaserCollection.publicId,
                page: page,
                sorting: teaserCollection.currentSorting,
                filters: teaserCollection.currentFilters,
                success: {
                    teaserCollection in
                    teaserCollections[page] = teaserCollection
                    dispatchGroup.leave()
            },
                failure: {
                    error in
                    errors.append(error)
                    dispatchGroup.leave()
            })
        }

        dispatchGroup.notify(queue: .main) {
            if let error = errors.first {
                return failure(error)
            }

            guard let numTotal = teaserCollections[0]?.numTotal else { return }

            let teasers: [Teaser] = (0...teaserCollection.currentPage)
                .map { teaserCollections[$0]?.teasers ?? [] }
                .flatMap { $0 }

            teaserCollection.teasers = teasers
            teaserCollection.numTotal = numTotal
            success(teaserCollection)
        }
    }
}
