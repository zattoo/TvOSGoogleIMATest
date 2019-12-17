//
//  ZattooEasycastZapiUsesCases.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 06.12.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class ZattooEasycastZapiUsesCases: NSObject, EasycastZapiUsesCases {

    private let easycastRepository: EasycastRepository

    // MARK: - Initializers

    convenience public override init() {
        self.init(easycastRepository: ZattooEasycastRepository())
    }

    init(easycastRepository: EasycastRepository) {
        self.easycastRepository = easycastRepository
        super.init()
    }

    @objc
    public func listZapiEasycastDevices(success: @escaping ([EasycastReceiver]) -> Void,
                                 failure: @escaping (Swift.Error) -> Void) {

        self.easycastRepository.listReceiver(success: { success($0.DTOs) }, failure: { failure($0.DTO) })
    }
}
