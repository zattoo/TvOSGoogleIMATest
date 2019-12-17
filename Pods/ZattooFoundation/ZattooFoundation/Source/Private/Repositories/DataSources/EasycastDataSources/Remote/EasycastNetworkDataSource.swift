//
//  EasycastNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 06.12.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol EasycastNetworkDataSource {

    @discardableResult
    func listReceiver(success: @escaping ([EasycastReceiverEntity]) -> Void,
                      failure: @escaping (NetworkEntityError) -> Void) -> Cancelable?
}
