//
//  PageEntity.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


struct PageEntity {
    let publicId: String
    let style: PageStyleEntity
    let title: String
    let logoToken: String?
    var pageElements: [PageElementEntity]
    let ad: EditorialAdEntity?
    let subNavigationPublicId: String?
    let displayEmptyRecordings: Bool
    let displayTotalRecordings: Bool
    let navigationContext: EditorialNavigationContextEntity?
}
