//
//  Vod.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 5/8/19.
//  Copyright © 2019 Zattoo, Inc. All rights reserved.
//

import Foundation


public typealias VodId = String

@objc public protocol Vod {
    var id: VodId { get }
    var teasableType: TeasableType { get }
    var title: String { get }
    var imageToken: String? { get }
    var imageStyle: ImageStyle { get }
    var captionLanguages: [Language] { get }
    var audioLanguages: [Language] { get }
    var subtitle: String? { get }
    var releaseDate: Date? { get }
    var vodDescription: String { get }
    var termsCatalog: [VodTermsCatalog] { get }
    var brand: Brand? { get }
    @objc optional var duration: TimeInterval { get }
}

extension Vod {

    internal var svodTerms: [VodTerm] {
        return termsCatalog.filter { $0.vodType == .svod }.flatMap { $0.terms }.filter { $0.vodType == .svod }
    }

    internal var hasOnlySvodTerms: Bool {
        let svodTermsCatalog = termsCatalog.filter { $0.vodType == .svod }
        return !svodTermsCatalog.isEmpty && svodTermsCatalog.count == termsCatalog.count
    }

    public var logoToken: String? {
        return brand?.logoToken
    }
}

extension VodMovie: Vod {

    public var vodDescription: String {
        return movieDescription
    }
}

extension VodEpisode: Vod {

    public var vodDescription: String {
        return episodeDescription
    }
}

extension VodSeason: Vod {

    public var vodDescription: String {
        return seasonDescription
    }

    public var subtitle: String? {
        return nil
    }
}
