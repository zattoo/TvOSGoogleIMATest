//
//  ZattooShopUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero on 29.08.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class ZattooShopUseCases: NSObject, ShopUseCases {
    
    private let shopRepository: ShopRepository

    // MARK: - Initializers
    
    convenience public override init() {
        self.init(shopRepository: ZattooShopRepository())
    }
    
    init(shopRepository: ShopRepository) {
        self.shopRepository = shopRepository
        super.init()
    }
    
    // MARK: - Public
    
    @objc
    public func offers(channelId: ChannelId,
                       success: @escaping ([Offer]) -> Void,
                       failure: @escaping (Error) -> Void) {
        
        shopRepository.offers(channelId: channelId,
                              success: {
                                offerModels in
                                success(offerModels.map { $0.DTO })
                              },
                              failure: { failure($0.DTO) })
    }
    
    @objc
    public func subscribe(offer: OfferId,
                          pin: String?,
                          success: @escaping () -> Void,
                          failure: @escaping (Error) -> Void) {
        
        shopRepository.subscribe(offer: offer,
                                 pin: pin,
                                 success: success,
                                 failure: { failure($0.DTO) })
    }
}
