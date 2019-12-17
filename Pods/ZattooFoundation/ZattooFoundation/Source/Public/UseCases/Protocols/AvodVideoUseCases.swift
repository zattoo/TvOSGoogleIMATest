//
//  AvodVideoUseCases.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 30.11.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc public protocol AvodVideoUseCases {

    @objc
    func details(token: String,
                 success: @escaping (AvodVideo) -> Void,
                 failure: @escaping (Error) -> Void)

}
