//
//  DispatchQueues.swift
//  Zattoo
//
//  Created by cgoldsby on 9/19/15.
//  Copyright © 2015 Zattoo, Inc. All rights reserved.
//

import Foundation


var GlobalMainQueue: DispatchQueue {
    return DispatchQueue.main
}

var GlobalUserInitiatedQueue: DispatchQueue {
    return DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated)
}

var GlobalUtilityQueue: DispatchQueue {
    return DispatchQueue.global(qos: DispatchQoS.QoSClass.utility)
}
