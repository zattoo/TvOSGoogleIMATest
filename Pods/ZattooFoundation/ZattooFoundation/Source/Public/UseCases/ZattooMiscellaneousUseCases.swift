//
//  ZattooMiscellaneousUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero on 03.08.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class ZattooMiscellaneousUseCases: NSObject, MiscellaneousUseCases {
    
    private let miscellaneousRepository: MiscellaneousRepository
    
    // MARK: - Initializers
    
    convenience public override init() {
        self.init(miscellaneousRepository: ZattooMiscellaneousRepository())
    }
    
    init(miscellaneousRepository: MiscellaneousRepository) {
        self.miscellaneousRepository = miscellaneousRepository
        super.init()
    }
    
    // MARK: - MiscellaneousUseCases
    
    @objc
    public func localizedContent(key: String,
                          success: @escaping (String) -> Void,
                          failure: @escaping (Error) -> Void) {
        
        miscellaneousRepository.localizedContent(
            key: key,
            success: { success($0) },
            failure: { failure($0.DTO) })
    }
}
