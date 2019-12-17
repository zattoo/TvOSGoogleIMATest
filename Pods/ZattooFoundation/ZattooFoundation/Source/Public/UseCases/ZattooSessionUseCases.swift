//
//  ZattooSessionUseCases.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 9/21/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class ZattooSessionUseCases: NSObject, SessionUseCases {
    
    private let sessionRepository: SessionRepository
    
    // MARK: - Initializers
    
    convenience public override init() {
        self.init(sessionRepository: ZattooSessionRepository())
    }
    
    init(sessionRepository: SessionRepository) {
        self.sessionRepository = sessionRepository
        super.init()
    }
    
    // MARK: - Public
    
    @objc
    public func session(success: @escaping (Session) -> Void,
                        failure: @escaping (Error) -> Void) {
        
        sessionRepository.session(
            success: { success($0.DTO) },
            failure: { failure($0.DTO) })
    }
    
    @objc
    public func refreshSession(success: @escaping (Session) -> Void,
                               failure: @escaping (Error) -> Void) {
        
        sessionRepository.refreshSession(
            success: { success($0.DTO) },
            failure: { failure($0.DTO) })
    }
    
    @objc
    public func publishPartner(with partnerId: PartnerId) {
        sessionRepository.publishPartner(with: partnerId)
    }
}
