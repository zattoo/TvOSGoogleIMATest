//
//  ZattooProgramSearchResponse.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 25.09.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooProgramSearchResponse: SwiftyJsonResponseSerializable {
    let programs: [ProgramEntity]
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init?(json: JSON) {
        guard json["success"].boolValue else { return nil }
        programs = json["programs"].transformEachElement(toProgramEntityFromSearch)
    }
}
