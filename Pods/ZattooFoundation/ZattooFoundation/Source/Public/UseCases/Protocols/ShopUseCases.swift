//
//  ShopUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero on 29.08.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc public protocol ShopUseCases {
    
    @objc
    func offers(channelId: ChannelId,
                success: @escaping ([Offer]) -> Void,
                failure: @escaping (Error) -> Void)
    
    @objc
    func subscribe(offer: OfferId,
                   pin: String?,
                   success: @escaping () -> Void,
                   failure: @escaping (Error) -> Void)
}

