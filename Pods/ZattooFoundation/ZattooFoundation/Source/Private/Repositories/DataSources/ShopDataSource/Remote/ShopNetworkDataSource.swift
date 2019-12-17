//
//  ShopNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero on 29.08.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol ShopNetworkDataSource {
    
    func offers(channelId: ChannelId,
                success: @escaping ([OfferEntity]) -> Void,
                failure: @escaping (NetworkEntityError) -> Void)
    
    func subscribe(offer: OfferId,
                   pin: String?,
                   success: @escaping () -> Void,
                   failure: @escaping (NetworkEntityError) -> Void)
}
