//
//  TeaserCollectionModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/27/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension TeaserCollectionModel: DTOConvertible {
    
    var DTO: TeaserCollection {
        let teaserDTOs = teasers.map { $0.DTO }
        return TeaserCollection(
            teasers: teaserDTOs,
            title: title,
            publicId: publicId,
            pagePublicId: pagePublicId,
            numTotal: numTotal,
            filters: filters.map { $0.DTO },
            currentFilters: currentFilters,
            sortings: sortings.map { $0.DTO },
            currentSorting: currentSorting,
            subNavigationPublicId: subNavigationPublicId,
            displayManageRecordings: displayManageRecordings,
            ad: ad?.DTO,
            logoToken: logoToken,
            displayEmptyRecordings: teasers.isEmpty && navigationContext == .recordings,
            displayTotalRecordings: displayTotalRecordings,
            navigationContext: navigationContext?.DTO,
            perPage: perPage)
    }
}
