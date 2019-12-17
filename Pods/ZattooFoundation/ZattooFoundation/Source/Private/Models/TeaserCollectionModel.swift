//
//  TeaserCollectionModel.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/26/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct TeaserCollectionModel {
    let teasers: [TeaserModel]
    let title: String
    let publicId: String
    let pagePublicId: String?
    let numTotal: Int
    let filters: [TeaserCollectionFilterModel]
    let currentFilters: TeaserCollectionFilterQuery
    let sortings: [SortingModel]
    let currentSorting: String?
    let subNavigationPublicId: String?
    let displayManageRecordings: Bool
    let ad: EditorialAdModel?
    let logoToken: String?
    let displayTotalRecordings: Bool
    let navigationContext: EditorialNavigationContextModel?
    let perPage: Int
}
