//
//  ZattooPowerDetailsResponse.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 7/20/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooPowerDetailsResponse: SwiftyJsonResponseSerializable {
    let programs: [ProgramEntity]
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init?(json: JSON) {
        guard json["success"].boolValue else { return nil }
        programs = json["programs"].transformEachElement(toProgramEntity)
    }
}
