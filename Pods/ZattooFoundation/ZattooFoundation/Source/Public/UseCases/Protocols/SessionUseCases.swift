//
//  SessionUseCases.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 9/20/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc public protocol SessionUseCases {
    
    @objc
    func session(success: @escaping (Session) -> Void,
                 failure: @escaping (Error) -> Void)
    
    @objc
    func refreshSession(success: @escaping (Session) -> Void,
                        failure: @escaping (Error) -> Void)
    
    @objc
    func publishPartner(with partnerId: PartnerId)
}
