//
//  PageElementEntity.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


struct PageElementEntity: Codable {
    let zapiParams: [String: String]
    let zapiPath: String
    let contentId: String
    let contentType: PageElementContentTypeEntity
    let content: PageElementContentEntity
    var teaserCollection: TeaserCollectionEntity?
    var subNavigationTabs: SubNavigationTabsEntity?
}
