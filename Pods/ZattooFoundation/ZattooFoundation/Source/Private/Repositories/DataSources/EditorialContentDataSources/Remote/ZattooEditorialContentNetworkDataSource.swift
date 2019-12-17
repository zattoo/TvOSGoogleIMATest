//
//  ZattooEditorialContentNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/26/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire


struct ZattooEditorialContentNetworkDataSource: EditorialContentNetworkDataSource {

    private let manager: SessionManager
    
    init(manager: SessionManager = SessionManager.shared) {
        self.manager = manager
    }
    
    // MARK: - EditorialContentNetworkDataSource
    
    func teaserCollection(pghash: String,
                          contentId: String,
                          page: Int,
                          perPage: Int,
                          sorting: String?,
                          filters: [String: [Any]]?,
                          success: @escaping (TeaserCollectionEntity) -> Void,
                          failure: @escaping (NetworkEntityError) -> Void) {
        
        
        var parameters: [String: Any] = [
            "page" : page,
            "per_page" : perPage
        ]

        if let sorting = sorting {
            parameters["sorting"] = sorting
        }

        if let filters = filters {
            for (_, element) in filters.enumerated() {
                parameters[element.key] = element.value.map({ String(describing: $0) }).joined(separator: ",")
            }
        }
        
        manager.request(endpoint: .teaserCollection(pghash: pghash, contentId: contentId), parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooTeaserCollectionResponse>) in
            
            switch result {
            case .success(let teaserCollectionResponse):
                success(teaserCollectionResponse.teaserCollection)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }

    func teaserCollection(pghash: String,
                          zapiParams: [String: String],
                          zapiPath: String,
                          page: Int,
                          perPage: Int,
                          sorting: String?,
                          filters: [String: [Any]]?,
                          success: @escaping (TeaserCollectionEntity) -> Void,
                          failure: @escaping (NetworkEntityError) -> Void) {

        var parameters: [String: Any] = zapiParams
        parameters["page"] = page
        parameters["per_page"] = perPage

        manager.request(url: Router(zapiPath, isPathPrefixRequired: false), method: .get, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooTeaserCollectionResponse>) in

            switch result {
            case .success(let teaserCollectionResponse):
                success(teaserCollectionResponse.teaserCollection)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    func page(pghash: String,
              publicId: String,
              success: @escaping (PageEntity) -> Void,
              failure: @escaping (NetworkEntityError) -> Void) {
        
        manager.request(endpoint: .page(pghash: pghash, publicId: publicId), parameters: nil).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooPageResponse>) in
            
            // mutable page response for injected teaser collections
            switch result {
            case .success(var pageResponse):
                let teaserCollectionGroup = DispatchGroup()
                
                var teaserCollectionEntities = [String: TeaserCollectionEntity]()
                var subNavigationTabsEntities = [String: SubNavigationTabsEntity]()
                
                for pageElement in pageResponse.page.pageElements {
                
                    switch pageElement.contentType {
                    case .teaserCollection:
                        self.fetchTeaserCollection(pghash: pghash, pageElement: pageElement, dispatchGroup: teaserCollectionGroup) {
                            teaserCollection in
                            teaserCollectionEntities[pageElement.contentId] = teaserCollection
                        }
                    case .subnavigation:
                        self.fetchSubnavigation(publicId: pageElement.contentId, dispatchGroup: teaserCollectionGroup) {
                            subNavigationTabs in
                            subNavigationTabsEntities[pageElement.contentId] = subNavigationTabs
                        }
                    case .notSupported:
                        continue
                    }
                }
                
                teaserCollectionGroup.notify(queue: DispatchQueue.global(qos: .background)) {
                    var mutablePageElements = [PageElementEntity]()
                    
                    for var pageElement in pageResponse.page.pageElements {
                        
                        // inject teaser collections into page elements
                        pageElement.teaserCollection = teaserCollectionEntities[pageElement.contentId]
                
                        // inject subnavigation tabs into page elements
                        pageElement.subNavigationTabs = subNavigationTabsEntities[pageElement.contentId]
                        
                        mutablePageElements.append(pageElement)
                    }
                    
                    pageResponse.page.pageElements = mutablePageElements

                    DispatchQueue.main.async {
                        success(pageResponse.page)
                    }
                }
                
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }

    func subNavigations(publicId: String,
                        success: @escaping (SubNavigationTabsEntity) -> Void,
                        failure: @escaping (NetworkEntityError) -> Void) {

        manager.request(endpoint: .subNavigations(publicId: publicId)).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooSubNavigationsResponse>) in

            switch result {
            case .success(let subNavigationsResponse):
                success(subNavigationsResponse.subNavigationTabsEntities)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    // MARK: - Private
    
    private func fetchTeaserCollection(pghash: String, pageElement: PageElementEntity, dispatchGroup: DispatchGroup, completion: @escaping (TeaserCollectionEntity) -> Void) {
        
        dispatchGroup.enter()

        teaserCollection(
            pghash: pghash,
            zapiParams: pageElement.zapiParams,
            zapiPath: pageElement.zapiPath,
            page: 0,
            perPage: pageElement.perPage,
            sorting: nil,
            filters: nil,
            success: {
                teaserCollection in
                completion(teaserCollection)
                dispatchGroup.leave()
            },
            failure: {
                error in
                dispatchGroup.leave()
        })
    }
    
    private func fetchSubnavigation(publicId: String, dispatchGroup: DispatchGroup, completion: @escaping (SubNavigationTabsEntity) -> Void) {
        
        dispatchGroup.enter()

        subNavigations(
            publicId: publicId,
            success: {
                subNavigationTabsEntity in
                completion(subNavigationTabsEntity)
                dispatchGroup.leave()
            },
            failure: {
                error in
                dispatchGroup.leave()
        })
    }
}
