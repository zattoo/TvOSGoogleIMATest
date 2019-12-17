//
//  ZattooChannelListNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 4/18/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire


struct ZattooChannelListNetworkDataSource: ChannelListNetworkDataSource {
    
    private let manager: SessionManager
    
    init(manager: SessionManager = SessionManager.shared) {
        self.manager = manager
    }
    
    // MARK: ChannelListNetworkDataSource
    
    func channelList(pghash: String,
                     success: @escaping ([ChannelGroupEntity]) -> Void,
                     failure: @escaping (NetworkEntityError) -> Void) {
        
        manager.request(endpoint: .channels(pghash: pghash), parameters: ["details" : "False"]).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooChannelsResponse>) in
            
            switch result {
            case .success(let channelsReponse):
                success(channelsReponse.channelGroups)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
}
