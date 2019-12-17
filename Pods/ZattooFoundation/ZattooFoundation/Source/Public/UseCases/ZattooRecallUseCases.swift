//
//  ZattooRecallUseCases.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 19.07.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class ZattooRecallUseCases: NSObject, RecallUseCases {

    private let recallRepository: RecallRepository

    // MARK: - Initializers

    convenience public override init() {
        self.init(recallRepository: ZattooRecallRepository())
    }

    init(recallRepository: RecallRepository) {
        self.recallRepository = recallRepository
        super.init()
    }

    @objc
    public func enableRecall(success: @escaping () -> Void, failure: @escaping (Swift.Error) -> Void) {
        recallRepository.enableRecall(success: { success() }, failure: { failure($0.DTO) })
    }
}
