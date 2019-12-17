//
//  QualityInfoModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/15/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


private let logoBaseUrl = "https://logos.zattic.com"

extension QualityInfoModel: DTOConvertible {
    
    var DTO: QualityInfo {
        return QualityInfo(availability: availabilityModel.DTO,
                           qualityLevel: qualityLevelModel.DTO,
                           title: title,
                           logoToken: logoToken,
                           streamTypes: streamTypes,
                           drmRequired: drmRequired)
    }
    
    private func logoUrl(withPath path: String?) -> URL? {
        guard let path = path, let baseURL = ZattooConfiguration.shared.logoBaseURL ?? URL(string: logoBaseUrl) else { return nil }
        return URL(string: baseURL.absoluteString + path)
    }
}
