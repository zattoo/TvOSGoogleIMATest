//
//  SwiftyJsonResponseSerializable.swift
//  Zattoo
//
//  Created by Christopher Goldsby on 10/15/15.
//  Copyright © 2015 Zattoo, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON


protocol SwiftyJsonResponseSerializable {
    
    init?(json: JSON)
}
