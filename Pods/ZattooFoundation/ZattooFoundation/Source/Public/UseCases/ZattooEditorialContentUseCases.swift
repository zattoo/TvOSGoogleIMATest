//
//  ZattooEditorialContentUseCases.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/27/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation

private let topShelfTeaserCollectionPublicId = "highlights_apple_tvos_home_screen_live"
private let topShelfTeaserCollectionPage = 0
private let topShelfTeaserCollectionPerPage = 8
private let teaserCollectionPerPage = 10

final public class ZattooEditorialContentUseCases: NSObject, EditorialContentUseCases {
    
    private let sessionRepository: SessionRepository
    private let editorialContentRepository: EditorialContentRepository

    // MARK: - Initializers
    
    convenience public override init() {
        self.init(sessionRepository: ZattooSessionRepository(), editorialContentRepository: ZattooEditorialContentRepository())
    }
    
    init(sessionRepository: SessionRepository, editorialContentRepository: EditorialContentRepository) {
        self.sessionRepository = sessionRepository
        self.editorialContentRepository = editorialContentRepository
        super.init()
    }
    
    // MARK: - EditorialContentUseCases

    @objc
    public func teaserCollection(zapiParams: [String: String],
                                 zapiPath: String,
                                 page: Int,
                                 success: @escaping (TeaserCollection) -> Void,
                                 failure: @escaping (Error) -> Void) {

        teaserCollection(zapiParams: zapiParams, zapiPath: zapiPath, page: page, sorting: nil, filters: nil, success: success, failure: failure)
    }

    @objc
    public func teaserCollection(zapiParams: [String: String],
                                 zapiPath: String,
                                 page: Int,
                                 sorting: String?,
                                 filters: [String: [Any]]?,
                                 success: @escaping (TeaserCollection) -> Void,
                                 failure: @escaping (Error) -> Void) {

        sessionRepository.session(success: {
            [weak self] session in
            self?.editorialContentRepository.teaserCollection(
                pghash: session.pghash,
                zapiParams: zapiParams,
                zapiPath: zapiPath,
                page: page,
                perPage: teaserCollectionPerPage,
                sorting: sorting,
                filters: filters,
                success: { success($0.DTO) },
                failure: { failure($0.DTO) }
            )
            }, failure: { failure($0.DTO) })
    }

    @objc
    public func teaserCollection(contentId: String,
                                 page: Int,
                                 sorting: String?,
                                 filters: [String: [Any]]?,
                                 success: @escaping (TeaserCollection) -> Void,
                                 failure: @escaping (Error) -> Void) {

        sessionRepository.session(success: {
            [weak self] session in
            self?.teaserCollection(
                pghash: session.pghash,
                contentId: contentId,
                page: page,
                sorting: sorting,
                filters: filters,
                success: success,
                failure: failure)
            }, failure: { failure($0.DTO) })
    }
    
    @objc
    public func topShelfTeaserCollection(publicId: String?,
                                         success: @escaping (TeaserCollection) -> Void,
                                         failure: @escaping (Error) -> Void) {

        sessionRepository.session(success: {
            [weak self] session in
            self?.teaserCollection(
                pghash: session.pghash,
                contentId: publicId ?? topShelfTeaserCollectionPublicId,
                page: topShelfTeaserCollectionPage,
                sorting: nil,
                filters: nil,
                success: success,
                failure: failure)
        }, failure: { failure($0.DTO) })
    }
    
    @objc
    public func page(publicId: String,
                     success: @escaping (Page) -> Void,
                     failure: @escaping (Error) -> Void) {
        
        sessionRepository.session(success: {
            [weak self] session in
            self?.page(pghash: session.pghash,
                       publicId: publicId,
                       success: success,
                       failure: failure)
        }, failure: { failure($0.DTO) })
    }

    @objc
    public func subNavigations(publicId: String,
                               success: @escaping ([SubNavigationTab]) -> Void,
                               failure: @escaping (Error) -> Void) {
        
        editorialContentRepository.subNavigations(publicId: publicId,
                                                  success: { success($0.map({ $0.DTO })) },
                                                  failure: { failure($0.DTO) })
    }

    @objc
    public func subNavigationsOfPage(publicId: String,
                              success: @escaping ([SubNavigationTab]) -> Void,
                              failure: @escaping (Error) -> Void) {

        page(publicId: publicId,
             success: {
                [weak self] page in

                guard let id = page.subNavigationPublicId else {
                    failure(Error(code: .unexpectedError))
                    return
                }

                self?.subNavigations(publicId: id,
                                     success: success,
                                     failure: failure)
        },
             failure: failure
        )
    }

    // MARK: - Private
    
    private func teaserCollection(pghash: String,
                                  contentId: String,
                                  page: Int,
                                  sorting: String?,
                                  filters: [String: [Any]]?,
                                  success: @escaping (TeaserCollection) -> Void,
                                  failure: @escaping (Error) -> Void) {
        
        editorialContentRepository.teaserCollection(
            pghash: pghash,
            contentId: contentId,
            page: page,
            perPage: teaserCollectionPerPage,
            sorting: sorting,
            filters: filters,
            success: { success($0.DTO) },
            failure: { failure($0.DTO) }
        )
    }

    private func page(pghash: String,
                      publicId: String,
                      success: @escaping (Page) -> Void,
                      failure: @escaping (Error) -> Void) {

        editorialContentRepository.page(
            pghash: pghash,
            publicId: publicId,
            success: {
                success($0.DTO)
        },
            failure: {
                failure($0.DTO)
        })
    }

}
