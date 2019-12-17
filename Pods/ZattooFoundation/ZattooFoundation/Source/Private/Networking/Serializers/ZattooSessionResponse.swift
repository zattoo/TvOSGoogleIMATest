//
//  ZattooSessionResponse.swift
//  Zattoo
//
//  Created by Christopher Goldsby on 10/15/15.
//  Copyright © 2015 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ZattooSessionResponse: SwiftyJsonResponseSerializable {
    let session: SessionEntity
    
    // MARK: - SwiftyJsonResponseSerializable
    
    init?(json: JSON) {
        guard json["success"].boolValue else { return nil }
        
        guard let sessionEntity = SessionEntity(json: json["session"]) else {
            return nil
        }
        
        session = sessionEntity
    }
}
