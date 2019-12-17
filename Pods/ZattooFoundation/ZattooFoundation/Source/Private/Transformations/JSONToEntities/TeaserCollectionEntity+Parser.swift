//
//  TeaserCollectionEntity+Parser.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/26/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


extension TeaserCollectionEntity {
    
    init(json: JSON) {
        teasers = json["teasers"].transformEachElement(toTeaserEntity)
        publicId = json["public_id"].stringValue
        pagePublicId = json["page_public_id"].string
        title = json["title"].stringValue
        numTotal = json["teasers_total"].intValue
        filters = json["filterings"].arrayValue.map({ TeaserCollectionFilterEntity(json: $0) })
        currentFilters = json["current_filterings"].teaserCollectionFilterQueryValue
        sortings = json["sortings"].arrayValue.map({ SortingEntity(json: $0) })
        currentSorting = json["current_sorting"].string
        subNavigationPublicId = json["sub_navigation_public_id"].string
        displayManageRecordings = json["display_manage_recordings"].boolValue
        ad = toEditorialAdEntity(json: json["ad"])
        logoToken = json["logo_token"].string
        displayTotalRecordings = json["display_total_recordings"].boolValue
        navigationContext = json["navigation_context"].navigationContextValue
    }
}

// MARK: - Private

private func toEditorialAdEntity(json: JSON) -> EditorialAdEntity? {
    return EditorialAdEntity(json: json)
}

private func toTeaserEntity(json: JSON) -> TeaserEntity {
    return TeaserEntity(json: json)
}
