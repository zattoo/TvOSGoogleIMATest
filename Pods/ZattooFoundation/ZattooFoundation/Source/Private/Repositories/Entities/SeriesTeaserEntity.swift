//
//  SeriesTeaserEntity.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 11/10/18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


struct SeriesTeaserEntity: Codable {
    let cid: ChannelId
    let title: String
    let imageToken: String
    let tvSeriesId: Int
    let isSeriesRecordingEligible: Bool
    let isRecordingsOnly: Bool
}
