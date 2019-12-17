//
//  UserAgentString.swift
//  ZattooFoundation
//
//  Created by David Cordero on 07.02.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc
public class UserAgent: NSObject {

    private let configuration: Configuration

    convenience public override init() {
        self.init(configuration: ZattooConfiguration.shared)
    }

    init(configuration: Configuration) {
        self.configuration = configuration
    }

    @objc
    public func descriptor() -> String {
        return "Mozilla/5.0 (\(deviceName()); CPU iPhone OS \(systemVersion()) like Mac OSX) \(appNameAndVersion())"
    }

    // MARK: - Private

    private func systemVersion() -> String {
        let version = ProcessInfo.processInfo.operatingSystemVersion
        return "\(version.majorVersion)_\(version.minorVersion)_\(version.patchVersion)"
    }

    private func deviceName() -> String {
        #if os(tvOS)
            return "Apple TV"
        #elseif os(OSX)
            return "Macintosh"
        #elseif os(iOS)
            return "iPhone"
        #endif
    }

    private func appNameAndVersion() -> String {
        guard let displayName = configuration.displayName,
            let appVersion = configuration.appVersion else { return "" }
        return "\(displayName)/\(appVersion)"
    }
}
