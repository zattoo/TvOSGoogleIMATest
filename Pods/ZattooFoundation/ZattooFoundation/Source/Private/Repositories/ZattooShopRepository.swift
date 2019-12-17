//
//  ZattooShopRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero on 29.08.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


struct ZattooShopRepository: ShopRepository {
    
    private let networkDataSource: ShopNetworkDataSource
    
    // MARK: - Initializers
    
    init(networkDataSource: ShopNetworkDataSource = ZattooShopNetworkDataSource()) {
        self.networkDataSource = networkDataSource
    }
    
    // MARK: - ShopRepository
    
    func offers(channelId: ChannelId,
                success: @escaping ([OfferModel]) -> Void,
                failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.offers(channelId: channelId,
                                 success: {
                                    offerEntities in
                                    success(offerEntities.map { $0.model })
                                 },
                                 failure: { failure($0.model) })
    }
    
    func subscribe(offer: OfferId,
                   pin: String?,
                   success: @escaping () -> Void,
                   failure: @escaping (ErrorModel) -> Void) {
        
        networkDataSource.subscribe(offer: offer,
                                    pin: pin,
                                    success: success,
                                    failure: { failure($0.model) })
    }
}
