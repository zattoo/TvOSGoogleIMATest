//
//  SessionRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/24/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol SessionRepository {
    
    func session(success: @escaping (SessionModel) -> Void,
                 failure: @escaping (ErrorModel) -> Void)
    
    
    func refreshSession(success: @escaping (SessionModel) -> Void,
                        failure: @escaping (ErrorModel) -> Void)
    
    func hello(success: @escaping (SessionModel) -> Void,
               failure: @escaping (ErrorModel) -> Void)
    
    func publishPartner(with partnerId: PartnerId)

    func track(_ urls: [(event: String, url: URL)])
}
