//
//  PageModel.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 26.07.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


struct PageModel {
    let publicId: String
    let style: PageStyleModel
    let title: String
    let logoToken: String?
    let pageElements: [PageElementModel]
    let ad: EditorialAdModel?
    let subNavigationPublicId: String?
    let displayEmptyRecordings: Bool
    let displayTotalRecordings: Bool
    let navigationContext: EditorialNavigationContextModel?
}
