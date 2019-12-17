//
//  ZattooEditorialContentRepository.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/27/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ZattooEditorialContentRepository: EditorialContentRepository {
    private let networkDataSource: EditorialContentNetworkDataSource
    
    // MARK: - Initializers
    
    init(networkDataSource: EditorialContentNetworkDataSource = ZattooEditorialContentNetworkDataSource()) {
        self.networkDataSource = networkDataSource
    }
    
    // MARK: - EditorialContentRepository
    
    func teaserCollection(pghash: String,
                          contentId: String,
                          page: Int,
                          perPage: Int,
                          sorting: String?,
                          filters: [String: [Any]]?,
                          success: @escaping (TeaserCollectionModel) -> Void,
                          failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.teaserCollection(pghash: pghash,
                                           contentId: contentId,
                                           page: page,
                                           perPage: perPage,
                                           sorting: sorting,
                                           filters: filters,
                                           success: { success($0.model(perPage: perPage)) },
                                           failure: { failure($0.model) })
    }

    func teaserCollection(pghash: String,
                          zapiParams: [String: String],
                          zapiPath: String,
                          page: Int,
                          perPage: Int,
                          sorting: String?,
                          filters: [String: [Any]]?,
                          success: @escaping (TeaserCollectionModel) -> Void,
                          failure: @escaping (ErrorModel) -> Void) {

        networkDataSource.teaserCollection(pghash: pghash,
                                           zapiParams: zapiParams,
                                           zapiPath: zapiPath,
                                           page: page,
                                           perPage: perPage,
                                           sorting: sorting,
                                           filters: filters,                                           
                                           success: { success($0.model(perPage: perPage)) },
                                           failure: { failure($0.model) })
    }
    
    func page(pghash: String,
              publicId: String,
              success: @escaping (PageModel) -> Void,
              failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.page(pghash: pghash,
                               publicId: publicId,
                               success: { success($0.model) },
                               failure: { failure($0.model) })
        
    }

    func subNavigations(publicId: String,
                        success: @escaping ([SubNavigationTabModel]) -> Void,
                        failure: @escaping (ErrorModel) -> Void) {

        networkDataSource.subNavigations(publicId: publicId,
                                         success: { success($0.tabs.map({ $0.model })) },
                                         failure: { failure($0.model) })
    }
}
