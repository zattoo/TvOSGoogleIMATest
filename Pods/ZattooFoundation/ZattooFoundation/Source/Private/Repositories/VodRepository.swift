//
//  VodRepository.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/26/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol VodRepository {
    
    func vodStatuses(success: @escaping (VodStatusCollectionModel) -> Void,
                     failure: @escaping (ErrorModel) -> Void)

    func order(id: TeasableId,
               teasableType: TeasableTypeModel,
               token: String,
               success: @escaping (VodStatusModel) -> Void,
               failure: @escaping (ErrorModel) -> Void)
    
    func removeAll()

    @discardableResult
    func search(pghash: String,
                query: String,
                success: @escaping (VodSearchResultModel) -> Void,
                failure: @escaping (ErrorModel) -> Void) -> Cancelable?

    func updateVodStatus(id: TeasableId,
                         teasableType: TeasableTypeModel,
                         position: TimeInterval?,
                         captionLanguageCode: String?,
                         audioLanguageCode: String?,
                         success: @escaping (VodStatusUpdateResultModel) -> Void,
                         failure: @escaping (ErrorModel) -> Void)

    func vodMovie(id: VodId,
                  success: @escaping (VodMovieModel) -> Void,
                  failure: @escaping (ErrorModel) -> Void)
    
    func vodSeries(id: VodSeriesId,
                   season: VodId?,
                   success: @escaping (VodSeriesModel) -> Void,
                   failure: @escaping (ErrorModel) -> Void)

    func vodWatchList(success: @escaping (VodWatchListModel) -> Void,
                      failure: @escaping (ErrorModel) -> Void)

    func vodWatchListAdd(id: TeasableId,
                         teasableType: TeasableTypeModel,
                         success: @escaping (VodWatchListModel) -> Void,
                         failure: @escaping (ErrorModel) -> Void)

    func vodWatchListRemove(id: TeasableId,
                            teasableType: TeasableTypeModel,
                            success: @escaping (VodWatchListModel) -> Void,
                            failure: @escaping (ErrorModel) -> Void)
}
