//
//  ZattooShopNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero on 29.08.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


struct ZattooShopNetworkDataSource: ShopNetworkDataSource {
    
    private let manager: SessionManager
    
    init(manager: SessionManager = SessionManager.shared) {
        self.manager = manager
    }
    
    // MARK: - FavoritesNetworkDataSource
    
    func offers(channelId: ChannelId,
                success: @escaping ([OfferEntity]) -> Void,
                failure: @escaping (NetworkEntityError) -> Void) {
        
        let parameters = ["context" : "channel:\(channelId)"]
        manager.request(endpoint: .zuyaCatalog, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooShopResponse>) in
            switch result {
            case .success(let shopResponse):
                success(shopResponse.offers)
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
    
    func subscribe(offer: OfferId,
                   pin: String?,
                   success: @escaping () -> Void,
                   failure: @escaping (NetworkEntityError) -> Void) {
        
        var parameters = ["offer_id" : offer]

        if let pin = pin {
            parameters["pin"] = pin
        }

        manager.request(endpoint: .zuyaSubscribe, parameters: parameters).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooResponse>) in
            switch result {
            case .success:
                success()
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
}
