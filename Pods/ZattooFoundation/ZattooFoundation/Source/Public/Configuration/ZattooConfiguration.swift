//
//  ZattooConfiguration.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/22/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import Reachability
import SwiftyJSON
import SwiftDate

let defaultHostUrl = URL(string: "https://zapi.zattoo.com")!
let zapiEnvironmentStorageKey = "zapiEnvironmentStorageKey"

@objcMembers
final public class ZattooConfiguration: NSObject, Configuration {
    public static let shared = ZattooConfiguration()
    public static let timeIntervalToAvoidDDOSAttack = TimeInterval.randomTimeIntervalToAvoidDDOSAttack
    public var appIdentifier: String?
    public var advertisingIdentifier: String?
    public var groupId: String?
    public let reachability: Reachable? = Reachability()
    public var logoBaseURL: URL?

    var userDefaults: UserDefaults = .standard
    
    public var zapiHostUrl: URL {
        get {
            if let customZapiEnvironment = customZapiEnvironment {
                return customZapiEnvironment.host
            }
            return productionZapiUrl
        }
    }
    
    public var zapiEnvironment: Environment = .production {
        didSet {
            userDefaults.set(zapiEnvironment.rawValue, forKey: zapiEnvironmentStorageKey)
            customZapiEnvironment = zapiEnvironment
        }
    }

    public lazy var groupUserDefaults: UserDefaults = {
        return UserDefaults(suiteName: groupId) ?? userDefaults
    }()

    deinit {
        (reachability as? Reachability)?.stopNotifier()
    }
    
    override init() {
        super.init()
        try? (reachability as? Reachability)?.startNotifier()
        setUpSwiftDateDefaultRegion()
        zapiEnvironment = customZapiEnvironment ?? .production
    }
    
    public func configure(withFilename filename: String, in bundle: Bundle = .main) {
        let path = bundle.path(forResource: filename, ofType: "json")!
        let content = try! String(contentsOfFile: path)
        let configurationJSON = try! JSON(data: content.data(using: String.Encoding.utf8)!)
        
        let platformConfiguration = configurationJSON[platform]
        let zapiConfiguration = platformConfiguration["zapi"]

        appIdentifier = zapiConfiguration["tid"].string
        productionZapiUrl = zapiConfiguration["host"].url!

        groupId = platformConfiguration["entitlements"]["app_groups"]["groups"].arrayValue.first?.stringValue
        logoBaseURL = configurationJSON["base_urls"]["logos"].url
    }
    
    var productionZapiUrl: URL = defaultHostUrl
    
    private lazy var customZapiEnvironment: Environment? = {
        if userDefaults.object(forKey: zapiEnvironmentStorageKey) == nil {
            return nil
        }
        
        let environmentRawValue = userDefaults.integer(forKey: zapiEnvironmentStorageKey)
        return Environment(rawValue: environmentRawValue)
    }()
    
    // MARK: - Private

    private var platform: String {
        #if os(tvOS)
            return "tvOS"
        #elseif os(iOS)
            return "iOS"
        #else
            return "macOS"
        #endif
    }

    private func setUpSwiftDateDefaultRegion() {
        SwiftDate.defaultRegion = .local
    }
}
