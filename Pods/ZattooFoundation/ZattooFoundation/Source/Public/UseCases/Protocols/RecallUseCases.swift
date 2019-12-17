//
//  RecallUseCases.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 19.07.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc public protocol RecallUseCases {

    @objc
    func enableRecall(success: @escaping () -> Void, failure: @escaping (Swift.Error) -> Void)
}

