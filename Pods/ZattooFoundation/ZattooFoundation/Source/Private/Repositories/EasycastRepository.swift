//
//  EasycastRepository.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 06.12.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol EasycastRepository {

    @discardableResult
    func listReceiver(success: @escaping ([EasycastReceiverModel]) -> Void,
                      failure: @escaping (ErrorModel) -> Void) -> Cancelable?
}
