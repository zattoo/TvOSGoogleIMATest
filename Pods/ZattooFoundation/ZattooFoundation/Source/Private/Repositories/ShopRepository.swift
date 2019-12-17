//
//  ShopRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero on 29.08.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol ShopRepository {
    
    func offers(channelId: ChannelId,
                success: @escaping ([OfferModel]) -> Void,
                failure: @escaping (ErrorModel) -> Void)
    
    func subscribe(offer: OfferId,
                   pin: String?,
                   success: @escaping () -> Void,
                   failure: @escaping (ErrorModel) -> Void)
}
