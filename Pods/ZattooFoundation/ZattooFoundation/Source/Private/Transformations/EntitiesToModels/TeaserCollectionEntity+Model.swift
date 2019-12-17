//
//  TeaserCollectionEntity+Model.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/26/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension TeaserCollectionEntity {
    
    func model(perPage: Int) -> TeaserCollectionModel {
        let teaserModels = teasers.map { $0.model }
        return TeaserCollectionModel(
            teasers: teaserModels,
            title: title,
            publicId: publicId,
            pagePublicId: pagePublicId,
            numTotal: numTotal,
            filters: filters.map { $0.model },
            currentFilters: currentFilters,
            sortings: sortings.map { $0.model },
            currentSorting: currentSorting,
            subNavigationPublicId: subNavigationPublicId,
            displayManageRecordings: displayManageRecordings,
            ad: ad?.model,
            logoToken: logoToken,
            displayTotalRecordings: displayTotalRecordings,
            navigationContext: navigationContext?.model,
            perPage: perPage
        )
    }
}
