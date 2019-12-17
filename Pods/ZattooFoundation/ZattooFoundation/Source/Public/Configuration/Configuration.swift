//
//  Configuration.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 6/23/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


#if canImport(UIKit)
    import UIKit
#endif


@objc public protocol Configuration {
    static var timeIntervalToAvoidDDOSAttack: TimeInterval { get }
    var appIdentifier: String? { get }
    var advertisingIdentifier: String? { get }
    var zapiHostUrl: URL { get }
    var groupId: String? { get }
    var reachability: Reachable? { get }
    var groupUserDefaults: UserDefaults { get }
}

public extension Configuration {
    
    var uuid: String {
        #if os(OSX)
            let userDefaults = UserDefaults.standard
            
            if let identifierForVendor = userDefaults.object(forKey: "ApplicationUniqueIdentifier") as? String {
                return identifierForVendor
            }

            let uuid = NSUUID().uuidString
            userDefaults.set(uuid, forKey: "ApplicationUniqueIdentifier")
            
            return uuid
        #else
            return UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
        #endif
    }
    
    var deviceType: String {
        #if os(tvOS)
            return "appletv"
        #elseif os(OSX)
            return "macos"
        #elseif os(iOS)
            return UIDevice.current.model
        #endif
    }
    
    var appVersion: String? {
        return Bundle.main.value(forKey: "CFBundleShortVersionString")
    }
    
    var bundleId: String? {
        return Bundle.main.value(forKey: "CFBundleIdentifier")
    }

    var displayName: String? {
        return Bundle.main.value(forKey: "CFBundleDisplayName")
    }

    var languageCode: String? {
        return Locale.current.languageCode
    }
    
    var shopEnvironment: String? {
        return UserDefaults.standard.string(forKey: "shopEnvironment")
    }
}
