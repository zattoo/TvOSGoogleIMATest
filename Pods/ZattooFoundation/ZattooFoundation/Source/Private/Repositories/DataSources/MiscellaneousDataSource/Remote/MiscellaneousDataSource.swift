//
//  MiscellaneousDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero on 03.08.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


protocol MiscellaneousDataSource {
    
    func localizedContent(key: String,
                          success: @escaping (String) -> Void,
                          failure: @escaping (NetworkEntityError) -> Void)
}
