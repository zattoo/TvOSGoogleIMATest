//
//  Service.swift
//  ZattooFoundation
//
//  Created by David Cordero on 23.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc(ZattooFoundationService)
final public class Service: NSObject {
    
    public let id: Int?
    public let name: String?
    public let type: String?
    public let subservices: [Int]
    
    init(id: Int?, name: String?, type: String?, subservices: [Int]) {
        self.id = id
        self.name = name
        self.type = type
        self.subservices = subservices
    }
}
