//
//  AdsUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.04.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


public protocol AdsUseCases {

    func fetchAdWith(style: AdStyle,
                     success: @escaping (DisplayAd) -> Void,
                     failure: @escaping (Error) -> Void)

    func fetchAdWith(path: String,
                     success: @escaping (DisplayAd) -> Void,
                     failure: @escaping (Error) -> Void)

    func adCompleted(success: @escaping () -> Void)
}

public extension AdsUseCases {

    func fetch(ad: EditorialAd,
               success: @escaping (DisplayAd) -> Void,
               failure: @escaping (Error) -> Void) {
        fetchAdWith(path: ad.zapiPath, success: success, failure: failure)
    }
}
