//
//  TeaserEntity.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/26/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


struct TeaserEntity: Codable {
    
    let teaserId: TeasableId
    let title: String?
    let teasableType: TeasableTypeEntity
    let teasable: ProgramEntity?
    let avodTeasable: AvodVideoEntity?
    let seriesTeasable: SeriesTeaserEntity?
    let vodMovieTeasable: VodMovieEntity?
    let vodSeriesTeasable: VodSeriesEntity?
    let text: String?
    let imageToken: String?
    let url: URL?
}
