//
//  EasycastReceiver.swift
//  ZattooFoundation
//
//  Created by Philipp Frischmuth on 06.12.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation


public enum EasycastReceiverStatus {

    case active
    case suspended
}

final public class EasycastReceiver: NSObject {

    public let state: EasycastReceiverStatus?
    public let uniqueID: String
    public let baseURL: String
    public let friendlyName: String?

    init(state: String, uniqueID: String, baseURL: String, friendlyName: String?) {
        switch state {
        case "active":
            self.state = .active
        case "suspend":
            self.state = .suspended
        default:
            self.state = nil
        }

        self.uniqueID = uniqueID
        self.baseURL = baseURL
        self.friendlyName = friendlyName
    }

    public override func isEqual(_ object: Any?) -> Bool {
        guard let otherReceiver = object as? EasycastReceiver else { return false }
        return uniqueID == otherReceiver.uniqueID
    }
}
