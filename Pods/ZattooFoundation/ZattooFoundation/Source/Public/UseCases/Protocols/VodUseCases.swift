//
//  VodUseCases.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/26/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


public protocol VodUseCases: ObjcVodUseCases {

    func order(id: TeasableId,
               teasableType: TeasableType,
               token: String,
               success: @escaping (VodStatusCollection) -> Void,
               failure: @escaping (Error) -> Void)

    func updateVodStatus(id: TeasableId,
                         teasableType: TeasableType,
                         position: TimeInterval?,
                         captionLanguageCode: String?,
                         audioLanguageCode: String?,
                         success: @escaping (VodStatusUpdateResult) -> Void,
                         failure: @escaping (Error) -> Void)

    func updateVodStatus(vod: Vod,
                         position: TimeInterval?,
                         success: @escaping (VodStatusUpdateResult) -> Void,
                         failure: @escaping (Error) -> Void)

    func vodMovie(id: VodId,
                  success: @escaping (VodMovie) -> Void,
                  failure: @escaping (Error) -> Void)
    
    func vodSeries(id: VodSeriesId,
                   season: VodId?,
                   success: @escaping (VodSeries) -> Void,
                   failure: @escaping (Error) -> Void)

    func vodWatchList(success: @escaping (VodWatchList) -> Void,
                      failure: @escaping (Error) -> Void)

    func vodWatchListAdd(id: TeasableId,
                         teasableType: TeasableType,
                         success: @escaping (VodWatchList) -> Void,
                         failure: @escaping (Error) -> Void)

    func vodWatchListRemove(id: TeasableId,
                            teasableType: TeasableType,
                            success: @escaping (VodWatchList) -> Void,
                            failure: @escaping (Error) -> Void)
}

@objc public protocol ObjcVodUseCases {

    func vodStatuses(success: @escaping (VodStatusCollection) -> Void,
                     failure: @escaping (Error) -> Void)
}
