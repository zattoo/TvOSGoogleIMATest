//
//  EasycastZapiUsesCases.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 06.12.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc public protocol EasycastZapiUsesCases {

    @objc
    func listZapiEasycastDevices(success: @escaping ([EasycastReceiver]) -> Void,
                                 failure: @escaping (Swift.Error) -> Void)
}
