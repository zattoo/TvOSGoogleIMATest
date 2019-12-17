//
//  ZattooAvodVideoUseCases.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 30.11.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class ZattooAvodVideoUseCases: NSObject, AvodVideoUseCases {

    private let sessionRepository: SessionRepository
    private let avodVideoRepository: AvodVideoRepository
    
    // MARK: - Initializers
    
    convenience public override init() {
        self.init(sessionRepository: ZattooSessionRepository(), avodVideoRepository: ZattooAvodVideoRepository())
    }
    
    init(sessionRepository: SessionRepository, avodVideoRepository: AvodVideoRepository) {
        self.sessionRepository = sessionRepository
        self.avodVideoRepository = avodVideoRepository
        super.init()
    }

    public func details(token: String,
                        success: @escaping (AvodVideo) -> Void,
                        failure: @escaping (Error) -> Void) {

        sessionRepository.session(
            success: {
                [weak self] _ in
                _ = self?.avodVideoRepository.details(
                    token,
                    success: { success($0.DTO) },
                    failure: { failure($0.DTO) })
            },
            failure: { failure($0.DTO) })
    }
}
