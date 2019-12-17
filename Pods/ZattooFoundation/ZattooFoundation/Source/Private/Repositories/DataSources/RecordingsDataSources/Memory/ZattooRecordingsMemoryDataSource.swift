//
//  ZattooRecordingsMemoryDataSource.swift
//  ZattooFoundation
//
//  Created by David Cordero on 01.02.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


final class ZattooRecordingsMemoryDataSource: GenericMemoryDataSource<ListOfRecordingsEntity> {

    static let shared: ZattooRecordingsMemoryDataSource = {
        return ZattooRecordingsMemoryDataSource()
    }()
}
