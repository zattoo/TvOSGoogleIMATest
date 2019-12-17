//
//  PageElementModel.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


struct PageElementModel {
    let zapiParams: [String: String]
    let zapiPath: String
    let contentId: String
    let contentType: PageElementContentTypeModel
    let content: PageElementContentModel
    let teaserCollection: TeaserCollectionModel?
    let subNavigationTabs: SubNavigationTabsModel?
}
