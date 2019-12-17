//
//  PageModel+DTO.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension PageModel: DTOConvertible {
    
    var DTO: Page {
        let pageElementsDTOs = pageElements.map { $0.DTO }
        return Page(publicId: publicId, style: style.DTO, title: title, logoToken: logoToken, pageElements: pageElementsDTOs, ad: ad?.DTO, subNavigationPublicId: subNavigationPublicId, displayEmptyRecordings: displayEmptyRecordings, displayTotalRecordings: displayTotalRecordings, navigationContext: navigationContext?.DTO)
    }
}
