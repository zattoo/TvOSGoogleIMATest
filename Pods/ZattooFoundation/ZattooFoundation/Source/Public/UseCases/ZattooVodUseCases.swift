//
//  ZattooVodUseCases.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 2/26/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class ZattooVodUseCases: NSObject, VodUseCases {

    private let vodRepository: VodRepository
    private let sessionRepository: SessionRepository
    private let storageUseCases: StorageUseCases

    // MARK: - Initializers

    convenience public override init() {
        self.init(
            vodRepository: ZattooVodRepository(),
            sessionRepository: ZattooSessionRepository(),
            storageUseCases: ZattooStorageUseCases()
        )
    }

    init(vodRepository: VodRepository,
         sessionRepository: SessionRepository,
         storageUseCases: StorageUseCases) {
        self.vodRepository = vodRepository
        self.sessionRepository = sessionRepository
        self.storageUseCases = storageUseCases
        super.init()
    }

    // MARK: - VodUseCases

    @objc
    public func vodStatuses(success: @escaping (VodStatusCollection) -> Void,
                            failure: @escaping (Error) -> Void) {

        sessionRepository.session(
            success: {
                [weak self] session in

                guard session.isVodEligible else {
                    return failure(Error(code: .vodRequired))
                }

                self?.vodRepository.vodStatuses(
                    success: { success($0.DTO) },
                    failure: { failure($0.DTO) }
                )
            },
            failure: { failure ($0.DTO) })
    }
    
    public func order(id: TeasableId,
                      teasableType: TeasableType,
                      token: String,
                      success: @escaping (VodStatusCollection) -> Void,
                      failure: @escaping (Error) -> Void) {

        vodRepository.order(
            id: id,
            teasableType: teasableType.model,
            token: token,
            success: {
                [weak self] _ in
                self?.vodStatuses(success: success, failure: failure)
            },
            failure: { failure($0.DTO) }
        )
    }

    public func updateVodStatus(id: TeasableId,
                                teasableType: TeasableType,
                                position: TimeInterval?,
                                captionLanguageCode: String?,
                                audioLanguageCode: String?,
                                success: @escaping (VodStatusUpdateResult) -> Void,
                                failure: @escaping (Error) -> Void) {

        vodRepository.updateVodStatus(
            id: id,
            teasableType: teasableType.model,
            position: position,
            captionLanguageCode: captionLanguageCode,
            audioLanguageCode: audioLanguageCode,
            success: { success($0.DTO) },
            failure: { failure($0.DTO) }
        )
    }

    public func updateVodStatus(vod: Vod,
                                position: TimeInterval?,
                                success: @escaping (VodStatusUpdateResult) -> Void,
                                failure: @escaping (Error) -> Void) {

        let dispatchGroup = DispatchGroup()
        var captionLanguageCode: String?
        var audioLanguageCode: String?

        dispatchGroup.enter()
        storageUseCases.value(
            forKey: MediaTrackType.caption,
            success: {
                value in
                if let value = value as? String {
                    captionLanguageCode = vod.captionLanguages.find(languageCode: value)
                }
                dispatchGroup.leave()
        },
            failure: {
                _ in
                dispatchGroup.leave()
        })

        dispatchGroup.enter()
        storageUseCases.value(
            forKey: MediaTrackType.audio,
            success: {
                value in
                if let value = value as? String {
                    audioLanguageCode = vod.audioLanguages.find(languageCode: value)
                }
                dispatchGroup.leave()
        },
            failure: {
                _ in
                dispatchGroup.leave()
        })

        dispatchGroup.notify(qos: .background, queue: .main) {
            [weak self] in
            self?.updateVodStatus(
                id: vod.id,
                teasableType: vod.teasableType,
                position: position,
                captionLanguageCode: captionLanguageCode,
                audioLanguageCode: audioLanguageCode,
                success: success,
                failure: failure
            )
        }
    }

    public func vodMovie(id: VodId,
                         success: @escaping (VodMovie) -> Void,
                         failure: @escaping (Error) -> Void) {

        vodRepository.vodMovie(
            id: id,
            success: { success($0.DTO) },
            failure: { failure($0.DTO) }
        )
    }
    
    public func vodSeries(id: VodSeriesId,
                          season: VodId?,
                          success: @escaping (VodSeries) -> Void,
                          failure: @escaping (Error) -> Void) {
        
        vodRepository.vodSeries(
            id: id,
            season: season,
            success: { success($0.DTO) },
            failure: { failure($0.DTO) }
        )
    }

    public func vodWatchList(success: @escaping (VodWatchList) -> Void,
                             failure: @escaping (Error) -> Void) {

        vodRepository.vodWatchList(
            success: { success($0.DTO) },
            failure: { failure($0.DTO) })
    }

    public func vodWatchListAdd(id: TeasableId,
                                teasableType: TeasableType,
                                success: @escaping (VodWatchList) -> Void,
                                failure: @escaping (Error) -> Void) {

        vodRepository.vodWatchListAdd(
            id: id,
            teasableType: teasableType.model,
            success: { success($0.DTO) },
            failure: { failure($0.DTO) })
    }

    public func vodWatchListRemove(id: TeasableId,
                                   teasableType: TeasableType,
                                   success: @escaping (VodWatchList) -> Void,
                                   failure: @escaping (Error) -> Void) {

        vodRepository.vodWatchListRemove(
            id: id,
            teasableType: teasableType.model,
            success: { success($0.DTO) },
            failure: { failure($0.DTO) })
    }
}
