//
//  PageElementModel+DTO.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension PageElementModel: DTOConvertible {
    
    var DTO: PageElement {
        return PageElement(zapiParams: zapiParams,
                           zapiPath: zapiPath,
                           contentId: contentId,
                           contentType: contentType.DTO,
                           content: content.DTO,
                           teaserCollection: teaserCollection?.DTO,
                           subNavigationTabs: subNavigationTabs?.DTO)
    }
}
