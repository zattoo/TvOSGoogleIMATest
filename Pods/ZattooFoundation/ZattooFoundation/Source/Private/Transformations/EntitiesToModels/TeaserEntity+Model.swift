//
//  TeaserEntity+Model.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/26/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


extension TeaserEntity: ModelConvertible {
    
    var model: TeaserModel {
        let teasable: Any?
        
        switch teasableType {
        case .generic,
             .editorialPage,
             .editorialTeaserCollection,
             .avodSeries,
             .vodSeason,
             .vodEpisode:
            teasable = nil
        case .tvSeries:
            teasable = self.seriesTeasable?.model
        case .avodVideo:
            teasable = self.avodTeasable?.model
        case .tvBroadcast, .tvMetaChannel:
            teasable = self.teasable?.model
        case .vodMovie:
            teasable = self.vodMovieTeasable?.model
        case .vodSeries:
            teasable = self.vodSeriesTeasable?.model
        }
        
        return TeaserModel(teaserId: teaserId, title: title, teasableType: teasableType.model, teasable: teasable, text: text, imageToken: imageToken, url: url)
    }
}
