//
//  RecallRepository.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 19.07.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol RecallRepository {

    func enableRecall(success: @escaping () -> Void,
                      failure: @escaping (ErrorModel) -> Void)
}
