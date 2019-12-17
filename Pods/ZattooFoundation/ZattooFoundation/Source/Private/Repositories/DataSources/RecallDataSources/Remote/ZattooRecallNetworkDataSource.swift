//
//  ZattooRecallNetworkDataSource.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 19.07.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire


struct ZattooRecallNetworkDataSource: RecallNetworkDataSource {

    private let manager: SessionManager

    init(manager: SessionManager = SessionManager.shared) {
        self.manager = manager
    }

    func enableRecall(success: @escaping () -> Void, failure: @escaping (NetworkEntityError) -> Void) {
        manager.request(endpoint: .recall).responseObject(errorEntity: NetworkEntityError.self) {
            (_, _, result: Result<ZattooResponse>) in

            switch result {
            case .success:
                success()
            case .failure(let errorEntity):
                guard let errorEntity = errorEntity as? NetworkEntityError else { return }
                failure(errorEntity)
            }
        }
    }
}
