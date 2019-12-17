//
//  VodSearchResultModel+DTO.swift
//  ZattooFoundation
//
//  Created by David Cordero on 01.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodSearchResultModel: DTOConvertible {
    
    var DTO: VodSearchResult {
        return VodSearchResult(total: total, totalPages: totalPages, page: page, perPage: perPage, vods: vodDTOs)
    }

    // MARK: - Private

    private var vodDTOs: [Teasable] {
        return vods.map {
            let dto: Teasable?
            switch $0 {
            case let vodMovie as VodMovieModel:
                dto = vodMovie.DTO
            case let vodSeries as VodSeriesModel:
                dto = vodSeries.DTO
            default:
                dto = nil
            }
            return dto
        }.compactMap { $0 }
    }
}
