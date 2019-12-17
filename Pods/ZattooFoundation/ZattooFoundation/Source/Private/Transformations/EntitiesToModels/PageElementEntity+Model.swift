//
//  PageElementEntity+Model.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension PageElementEntity: ModelConvertible {
    
    var model: PageElementModel {
        return PageElementModel(
            zapiParams: zapiParams,
            zapiPath: zapiPath,
            contentId: contentId,
            contentType: contentType.model,
            content: content.model,
            teaserCollection: teaserCollection?.model(perPage: perPage),
            subNavigationTabs: subNavigationTabs?.model
        )
    }
}
