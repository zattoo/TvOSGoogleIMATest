//
//  TeaserCollectionEntity.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/26/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct TeaserCollectionEntity: Codable {
    let teasers: [TeaserEntity]
    let publicId: String
    let pagePublicId: String?
    let title: String
    let numTotal: Int
    let filters: [TeaserCollectionFilterEntity]
    let currentFilters: TeaserCollectionFilterQuery
    let sortings: [SortingEntity]
    let currentSorting: String?
    let subNavigationPublicId: String?
    let displayManageRecordings: Bool
    let ad: EditorialAdEntity?
    let logoToken: String?
    let displayTotalRecordings: Bool
    let navigationContext: EditorialNavigationContextEntity?
}
