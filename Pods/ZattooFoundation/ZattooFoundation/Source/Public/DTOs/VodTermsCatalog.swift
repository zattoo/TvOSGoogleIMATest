//
//  VodTermsCatalog.swift
//  ZattooFoundation
//
//  Created by David Cordero on 07.03.19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class VodTermsCatalog: NSObject {
    public let vodType: VodType
    public let terms: [VodTerm]
    public let disclaimer: String?
    
    init(vodType: VodType, terms: [VodTerm], disclaimer: String?) {

        self.vodType = vodType
        self.terms = terms
        self.disclaimer = disclaimer
    }
}
