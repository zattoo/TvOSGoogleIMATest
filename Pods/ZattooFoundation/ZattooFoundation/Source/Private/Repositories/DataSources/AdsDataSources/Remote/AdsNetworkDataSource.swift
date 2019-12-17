//
//  AdsNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.04.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol AdsNetworkDataSource {

    func fetchAdWith(style: AdStyle,
                     success: @escaping (DisplayAdEntity) -> Void,
                     failure: @escaping (NetworkEntityError) -> Void)

    func fetchAdWith(path: String,
                     success: @escaping (DisplayAdEntity) -> Void,
                     failure: @escaping (NetworkEntityError) -> Void)

    func adCompleted(success: @escaping () -> Void)
}
