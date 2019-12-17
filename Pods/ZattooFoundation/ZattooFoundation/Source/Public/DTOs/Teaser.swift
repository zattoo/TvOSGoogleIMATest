//
//  Teaser.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 10/27/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


public typealias TeasableId = String

@objc(ZattooFoundationTeaser)
final public class Teaser: NSObject {
    
    public let teaserId: TeasableId
    public let title: String?
    public let teasableType: TeasableType
    public let teasable: Teasable?
    public let text: String?
    public let imageToken: String?
    public let url: URL?

    init(teaserId: TeasableId,
         title: String?,
         teasableType: TeasableType,
         teasable: NSObject?,
         text: String?,
         imageToken: String?,
         url: URL?) {
        self.teaserId = teaserId
        self.title = title
        self.teasableType = teasableType
        self.teasable = teasable as? Teasable
        self.text = text
        self.imageToken = imageToken
        self.url = url
    }
}

@objc(ZattooFoundationTeasableType)
public enum TeasableType: Int {
    case generic
    case tvBroadcast
    case tvMetaChannel
    case tvSeries
    case editorialPage
    case editorialTeaserCollection
    case avodVideo
    case avodSeries
    case vodMovie
    case vodSeries
    case vodEpisode
    case vodSeason
}
