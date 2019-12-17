//
//  EditorialContentRepository.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/27/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol EditorialContentRepository {

    func teaserCollection(pghash: String,
                          contentId: String,
                          page: Int,
                          perPage: Int,
                          sorting: String?,
                          filters: [String: [Any]]?,
                          success: @escaping (TeaserCollectionModel) -> Void,
                          failure: @escaping (ErrorModel) -> Void)

    func teaserCollection(pghash: String,
                          zapiParams: [String: String],
                          zapiPath: String,
                          page: Int,
                          perPage: Int,
                          sorting: String?,
                          filters: [String: [Any]]?,                          
                          success: @escaping (TeaserCollectionModel) -> Void,
                          failure: @escaping (ErrorModel) -> Void)
    
    func page(pghash: String,
              publicId: String,
              success: @escaping (PageModel) -> Void,
              failure: @escaping (ErrorModel) -> Void)

    func subNavigations(publicId: String,
                        success: @escaping ([SubNavigationTabModel]) -> Void,
                        failure: @escaping (ErrorModel) -> Void)
    
}
