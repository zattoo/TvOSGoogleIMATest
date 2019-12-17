//
//  TeaserCollection+Helpers.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/31/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


public extension TeaserCollection {

    var hasTeasersWithHideUnlessWatchList: Bool {
        return teasers.contains {
            teaser in
            switch teaser.teasable {
            case let vodMovie as VodMovie:
                return vodMovie.hideUnlessWatchList
            case let vodSeries as VodSeries:
                return vodSeries.hideUnlessWatchList
            default:
                return false
            }
        }
    }

    var hasTeasersWithHideUnlessRecording: Bool {
        return teasers.contains {
            teaser in
            switch teaser.teasable {
            case let program as Program:
                return program.hideUnlessRecording
            default:
                return false
            }
        }
    }

    // MARK: - Pagination

    var currentPage: Int {
        max(0, Int(ceil(Float(teasers.count) / Float(perPage)) - 1))
    }

    func nextPage() throws -> Int? {
        guard teasers.count < numTotal else { return nil }
        guard teasers.count % perPage == 0 else { throw PaginationError.perPage }
        return teasers.isEmpty ? 0 : currentPage + 1
    }

    enum PaginationError: String, Swift.Error {
        case perPage = "The number of teasers should be a multiple of `perPage`. This error may occur when a different `perPage` value is used to fetch the next teaser collection. When fetching a teaser collection the `perPage` value must remain the same for each request."
    }
}
