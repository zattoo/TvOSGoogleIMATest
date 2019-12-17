//
//  TeaserModel+DTO.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/27/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension TeaserModel: DTOConvertible {
    
    var DTO: Teaser {
        let teasable: NSObject?
        
        switch teasableType {
        case .generic,
             .editorialPage,
             .editorialTeaserCollection,
             .avodSeries,
             .vodEpisode,
             .vodSeason:
            teasable = nil
        case .tvSeries:
            teasable = (self.teasable as? SeriesTeaserModel)?.DTO
        case .avodVideo:
            teasable = (self.teasable as? AvodVideoModel)?.DTO
        case .tvBroadcast, .tvMetaChannel:
            teasable = (self.teasable as? ProgramModel)?.DTO
        case .vodMovie:
            teasable = (self.teasable as? VodMovieModel)?.DTO
        case .vodSeries:
            teasable = (self.teasable as? VodSeriesModel)?.DTO
        }

        return Teaser(teaserId: teaserId, title: title, teasableType: teasableType.DTO, teasable: teasable, text: text, imageToken: imageToken, url: url)
    }
}

extension TeasableTypeModel: DTOConvertible {
    
    var DTO: TeasableType {
        switch self {
        case .generic:
            return .generic
        case .tvBroadcast:
            return .tvBroadcast
        case .tvMetaChannel:
            return .tvMetaChannel
        case .tvSeries:
            return .tvSeries
        case .editorialPage:
            return .editorialPage
        case .editorialTeaserCollection:
            return .editorialTeaserCollection
        case .avodVideo:
            return .avodVideo
        case .avodSeries:
            return .avodSeries
        case .vodMovie:
            return .vodMovie
        case .vodSeries:
            return .vodSeries
        case .vodEpisode:
            return .vodEpisode
        case .vodSeason:
            return .vodSeason
        }
    }
}
