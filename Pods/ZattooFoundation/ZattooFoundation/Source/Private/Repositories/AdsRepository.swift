//
//  AdsRepository.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.04.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol AdsRepository {

    func fetchAdWith(style: AdStyle,
                     success: @escaping (DisplayAdModel) -> Void,
                     failure: @escaping (ErrorModel) -> Void)

    func fetchAdWith(path: String,
                     success: @escaping (DisplayAdModel) -> Void,
                     failure: @escaping (ErrorModel) -> Void)

    func adCompleted(success: @escaping () -> Void)
}
