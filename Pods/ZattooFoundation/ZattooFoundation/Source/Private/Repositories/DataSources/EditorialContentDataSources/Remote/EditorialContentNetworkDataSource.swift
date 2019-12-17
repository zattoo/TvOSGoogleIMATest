//
//  EditorialContentNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/26/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol EditorialContentNetworkDataSource {
    
    func teaserCollection(pghash: String,
                          contentId: String,
                          page: Int,
                          perPage: Int,
                          sorting: String?,
                          filters: [String: [Any]]?,
                          success: @escaping (TeaserCollectionEntity) -> Void,
                          failure: @escaping (NetworkEntityError) -> Void)

    func teaserCollection(pghash: String,
                          zapiParams: [String: String],
                          zapiPath: String,
                          page: Int,
                          perPage: Int,
                          sorting: String?,
                          filters: [String: [Any]]?,                          
                          success: @escaping (TeaserCollectionEntity) -> Void,
                          failure: @escaping (NetworkEntityError) -> Void)
    
    func page(pghash: String,
              publicId: String,
              success: @escaping (PageEntity) -> Void,
              failure: @escaping (NetworkEntityError) -> Void)

    func subNavigations(publicId: String,
                        success: @escaping (SubNavigationTabsEntity) -> Void,
                        failure: @escaping (NetworkEntityError) -> Void)
}
