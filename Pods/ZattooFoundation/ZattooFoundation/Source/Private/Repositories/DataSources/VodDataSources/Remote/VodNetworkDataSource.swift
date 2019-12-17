//
//  VodNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/22/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol VodNetworkDataSource {

    func vodStatuses(success: @escaping (VodStatusCollectionEntity) -> Void,
                     failure: @escaping (NetworkEntityError) -> Void)
    
    func order(id: TeasableId,
               teasableType: TeasableTypeEntity,
               token: String,
               success: @escaping (VodStatusEntity) -> Void,
               failure: @escaping (NetworkEntityError) -> Void)

    @discardableResult
    func search(pghash: String,
                query: String,
                success: @escaping (VodSearchResultEntity) -> Void,
                failure: @escaping (NetworkEntityError) -> Void) -> Cancelable?

    func updateVodStatus(id: TeasableId,
                         teasableType: TeasableTypeEntity,
                         position: TimeInterval?,
                         captionLanguageCode: String?,
                         audioLanguageCode: String?,
                         success: @escaping (VodStatusUpdateResultEntity) -> Void,
                         failure: @escaping (NetworkEntityError) -> Void)

    func vodMovie(id: VodId,
                  success: @escaping (VodMovieEntity) -> Void,
                  failure: @escaping (NetworkEntityError) -> Void)
    
    func vodSeries(id: VodSeriesId,
                   season: VodId?,
                   success: @escaping (VodSeriesEntity) -> Void,
                   failure: @escaping (NetworkEntityError) -> Void)

    func vodSubscriptions(success: @escaping (VodSubscriptionsEntity) -> Void,
                          failure: @escaping (NetworkEntityError) -> Void)

    func vodWatchList(success: @escaping (VodWatchListEntity) -> Void,
                      failure: @escaping (NetworkEntityError) -> Void)

    func vodWatchListAdd(id: TeasableId,
                         teasableType: TeasableTypeEntity,
                         success: @escaping (VodWatchListEntity) -> Void,
                         failure: @escaping (NetworkEntityError) -> Void)

    func vodWatchListRemove(id: TeasableId,
                            teasableType: TeasableTypeEntity,
                            success: @escaping (VodWatchListEntity) -> Void,
                            failure: @escaping (NetworkEntityError) -> Void)
}
