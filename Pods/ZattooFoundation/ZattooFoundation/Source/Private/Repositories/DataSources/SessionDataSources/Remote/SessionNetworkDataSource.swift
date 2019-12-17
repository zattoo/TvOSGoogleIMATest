//
//  SessionNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/31/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol SessionNetworkDataSource {
    
    func session(success: @escaping (SessionEntity) -> Void,
                 failure: @escaping (NetworkEntityError) -> Void)
    
    func hello(success: @escaping (SessionEntity) -> Void,
               failure: @escaping (NetworkEntityError) -> Void)
    
    func publishPartner(with partnerId: PartnerId)
    
    func track(_ urls: [(event: String, url: URL)])
}
