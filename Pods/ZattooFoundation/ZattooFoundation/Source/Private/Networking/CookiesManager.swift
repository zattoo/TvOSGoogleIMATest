//
//  CookiesManager.swift
//  ZattooFoundation
//
//  Created by David Cordero on 29.03.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation

#if !os(tvOS)
import WebKit
#endif

private let sessionCookieArchiveName = "SessionCookie"
private let sessionCookieName = "beaker.session.id"

protocol CookiesManager {

    func clearZrsSessionCookies(zrsHost: String, completion: @escaping () -> Void)
    func addSessionCookieIfMissing()
    func saveSessionCookie()
    func clearSessionCookie()
}

final class ZattooCookiesManager: CookiesManager {

    lazy var groupId: String? = {
        return ZattooConfiguration.shared.groupId
    }()

    func clearZrsSessionCookies(zrsHost: String, completion: @escaping () -> Void) {
        #if !os(tvOS)
        let cookiesDataType: Set<String> = [WKWebsiteDataTypeCookies]
        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: cookiesDataType) {
            let records = $0.filter { zrsHost.hasSuffix($0.displayName) }
            WKWebsiteDataStore.default().removeData(ofTypes: cookiesDataType, for: records) {
                completion()
            }
        }
        #else
        completion()
        #endif
    }

    func addSessionCookieIfMissing() {
        guard let groupId = groupId else { return }

        if let allCookies = HTTPCookieStorage.sharedCookieStorage(forGroupContainerIdentifier: groupId).cookies {
            if let _ = allCookies.first(where: { $0.name == sessionCookieName }) {
                return
            }
        }

        if let sessionCookieProperties = UserDefaults(suiteName: groupId)?.value(forKey: sessionCookieArchiveName) as? [HTTPCookiePropertyKey: Any] {
            if let sessionCookie = HTTPCookie(properties: sessionCookieProperties) {
                HTTPCookieStorage.sharedCookieStorage(forGroupContainerIdentifier: groupId).setCookie(sessionCookie)
            }
        }
    }

    func saveSessionCookie() {
        guard let groupId = groupId else { return }
        if let allCookies = HTTPCookieStorage.sharedCookieStorage(forGroupContainerIdentifier: groupId).cookies {

            if let sessionCookie = allCookies.first(where: { $0.name == sessionCookieName }) {
                UserDefaults(suiteName: groupId)?.set(sessionCookie.properties, forKey: sessionCookieArchiveName)
            }
        }
    }

    func clearSessionCookie() {
        guard let groupId = groupId else { return }
        if let _ = HTTPCookieStorage.sharedCookieStorage(forGroupContainerIdentifier: groupId).cookies {
            UserDefaults(suiteName: groupId)?.set(nil, forKey: sessionCookieArchiveName)
        }
    }
}
