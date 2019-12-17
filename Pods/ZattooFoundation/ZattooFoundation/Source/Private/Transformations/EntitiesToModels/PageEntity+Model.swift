//
//  PageEntity+Model.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


extension PageEntity: ModelConvertible {
    
    var model: PageModel {
        let pageElementModels = pageElements
            .filter { filterEmpty(pageElement: $0) }
            .map { $0.model }
        
        return PageModel(publicId: publicId, style: style.model, title: title, logoToken: logoToken, pageElements: pageElementModels, ad: ad?.model, subNavigationPublicId: subNavigationPublicId, displayEmptyRecordings: displayEmptyRecordings, displayTotalRecordings: displayTotalRecordings, navigationContext: navigationContext?.model)
    }
    
    // MARK: - Private
    
    private func filterEmpty(pageElement: PageElementEntity) -> Bool {
        switch pageElement.contentType {
        case .teaserCollection:
            return pageElement.teaserCollection != nil && !(pageElement.teaserCollection!.teasers.isEmpty)
        case .subnavigation:
            return pageElement.subNavigationTabs != nil && !(pageElement.subNavigationTabs!.tabs.isEmpty)
        case .notSupported:
            return true
        }
    }
}
