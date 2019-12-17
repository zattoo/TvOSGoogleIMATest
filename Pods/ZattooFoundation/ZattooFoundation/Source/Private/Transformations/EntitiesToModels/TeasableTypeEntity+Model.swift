//
//  TeasableTypeEntity+Model.swift
//  ZattooFoundation
//
//  Created by David Cordero on 21.05.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


extension TeasableTypeEntity: ModelConvertible {
    
    var model: TeasableTypeModel {
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
