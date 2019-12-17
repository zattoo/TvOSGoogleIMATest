//
//  SeasonSpec.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 28.11.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


public enum SeasonSpec {
    case allSeasons
    case currentSeason
    case season(seasonNumber: Int)
}
