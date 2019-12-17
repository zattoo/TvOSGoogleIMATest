//
//  VodSearchResultEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 01.04.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension VodSearchResultEntity: ModelConvertible {
    
    var model: VodSearchResultModel {
        return VodSearchResultModel(total: total, totalPages: totalPages, page: page, perPage: perPage, vods: vodModels)
    }
    
    // MARK: - Private
    
    private var vodModels: [Any] {
        return vods.map {
            let model: Any?
            switch $0 {
            case let vodMovie as VodMovieEntity:
                model = vodMovie.model
            case let vodSeries as VodSeriesEntity:
                model = vodSeries.model
            default:
                model = nil
            }
            return model
        }.compactMap { $0 }
    }
}
