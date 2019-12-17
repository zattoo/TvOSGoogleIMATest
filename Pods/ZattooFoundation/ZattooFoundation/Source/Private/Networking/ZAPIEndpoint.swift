//
//  ZAPIEndpoint.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 6/2/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation
import Alamofire


enum ZAPIEndpoint {
    case adCompleted
    case adDisplay
    case avodDetails(token: String)
    case avodSearch
    case castListReceiver
    case channels(pghash: String)
    case consents
    case consentUpdate
    case epg(pghash: String)
    case epgDetails(pghash: String)
    case epgSeriesDetails
    case facebookSSO
    case favorites
    case forgotPassword
    case googleSSO
    case hello
    case localizedContent(key: String)
    case login
    case logout
    case logSTBStats
    case page(pghash: String, publicId: String)
    case programSearch
    case publishPartner
    case recall
    case recordings
    case recordProgram
    case registerAccount
    case registerTimeshift(channel: ChannelId)
    case removeBatchRecording
    case removeRecording
    case selectiveRecall(channel: ChannelId, program: ProgramId)
    case session
    case startSeriesRecording
    case stopSeriesRecording
    case subNavigations(publicId: String)
    case teaserCollection(pghash: String, contentId: String)
    case undeleteRecording
    case updateFavorites
    case updateRecording
    case vodMovie(id: VodId)
    case vodOrder
    case vodSearch(pghash: String)
    case vodSeries(id: VodSeriesId)
    case vodStatus
    case vodStatusUpdate
    case vodSubscriptions
    case vodWatchList
    case vodWatchListAdd
    case vodWatchListRemove
    case watchAvod(token: VodToken)
    case watchLive(channel: ChannelId)
    case watchRecall(channel: ChannelId, program: ProgramId)
    case watchRecording(recording: RecordingId)
    case watchTimeshift(channel: ChannelId)
    case watchTvod(token: VodToken, provider: String)
    case watchVodTrailer
    case watchVodVideo
    case zuyaCatalog
    case zuyaSubscribe
    case zuyaToken
}

extension ZAPIEndpoint {
    var HTTPMethod: Alamofire.HTTPMethod {
        switch self {
        case .consentUpdate,
             .facebookSSO,
             .forgotPassword,
             .googleSSO,
             .hello,
             .login,
             .logout,
             .logSTBStats,
             .publishPartner,
             .recall,
             .recordProgram,
             .registerAccount,
             .registerTimeshift,
             .removeBatchRecording,
             .removeRecording,
             .selectiveRecall,
             .startSeriesRecording,
             .stopSeriesRecording,
             .undeleteRecording,
             .updateFavorites,
             .updateRecording,
             .vodOrder,
             .vodStatusUpdate,
             .vodWatchListAdd,
             .vodWatchListRemove,
             .watchAvod,
             .watchLive,
             .watchRecall,
             .watchRecording,
             .watchTimeshift,
             .watchTvod,
             .watchVodTrailer,
             .watchVodVideo,
             .zuyaSubscribe:
            return .post
        case .adDisplay,
             .adCompleted,
             .avodDetails,
             .avodSearch,
             .castListReceiver,
             .channels,
             .consents,
             .epg,
             .epgDetails,
             .epgSeriesDetails,
             .favorites,
             .localizedContent,
             .page,
             .programSearch,
             .recordings,
             .session,
             .subNavigations,
             .teaserCollection,
             .vodMovie,
             .vodSearch,
             .vodSeries,
             .vodStatus,
             .vodSubscriptions,
             .vodWatchList,
             .zuyaCatalog,
             .zuyaToken:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .adDisplay:
            return "v2/ad/display"
        case .adCompleted:
            return "v2/ad/completed"
        case .avodDetails(let token):
            return "avod/videos/\(token)"
        case .avodSearch:
            return "avod/videos/search"
        case .castListReceiver:
            return "cast/list_receiver"
        case .channels(let pghash):
            return "v2/cached/channels/\(pghash)"
        case .consents:
            return "zuya_list_consents"
        case .consentUpdate:
            return "zuya_update_consent"            
        case .epg(let pghash):
            return "v2/cached/program/power_guide/\(pghash)"
        case .epgDetails(let pghash):
            return "v2/cached/program/power_details/\(pghash)"
        case .epgSeriesDetails:
            return "series"
        case .facebookSSO:
            return "v2/account/login/facebook"
        case .favorites:
            return "channels/favorites"
        case .forgotPassword:
            return "forgot-password"
        case .googleSSO:
            return "v2/account/login/google"
        case .hello:
            return "v2/session/hello"
        case .localizedContent(let key):
            return "content/\(key)"
        case .login:
            return "v2/account/login"
        case .logout:
            return "v2/account/logout"
        case .logSTBStats:
            return "logging/stb_stats"
        case .page(let pghash, let publicId):
            return "v2/cached/\(pghash)/pages/\(publicId)"
        case .programSearch:
            return "program/search"
        case .publishPartner:
            return "session/partner/set"
        case .recall:
            return "channels/recall"
        case .recordings:
            return "v2/playlist"
        case .recordProgram:
            return "playlist/program"
        case .registerAccount:
            return "v2/account/new"
        case .registerTimeshift(let channel):
            return "timeshift/register/\(channel)"
        case .removeRecording:
            return "playlist/remove"
        case .removeBatchRecording:
            return "playlist/batch_remove"
        case .selectiveRecall(let channel, let program):
            return "watch/selective_recall/\(channel)/\(program)"
        case .session:
            return "v2/session"
        case .startSeriesRecording:
            return "series_recording/start"
        case .stopSeriesRecording:
            return "series_recording/remove"
        case .subNavigations(let publicId):
            return "sub_navigations/\(publicId)"
        case .teaserCollection(let pghash, let contentId):
            return "v2/cached/\(pghash)/teaser_collections/\(contentId)"
        case .updateFavorites:
            return "channels/favorites/update"
        case .updateRecording:
            return "playlist/recording"
        case .undeleteRecording:
            return "playlist/recording/undelete"
        case .vodMovie(let id):
            return "vod/movies/\(id)"
        case .vodOrder:
            return "vod/order"
        case .vodSearch(let pghash):
            return "cached/\(pghash)/vod/search"
        case .vodSeries(let id):
            return "vod/series/\(id)"
        case .vodStatus:
            return "vod/status"
        case .vodStatusUpdate:
            return "vod/status/update"
        case .vodSubscriptions:
            return "vod/subscriptions"
        case .vodWatchList:
            return "v2/vod/watch_list"
        case .vodWatchListAdd:
            return "v2/vod/watch_list/add"
        case .vodWatchListRemove:
            return "v2/vod/watch_list/remove"
        case .watchLive(let channel):
            return "watch/live/\(channel)"
        case .watchRecall(let channel, let program):
            return "watch/recall/\(channel)/\(program)"
        case .watchRecording(let recording):
            return "watch/recording/\(recording.stringValue)"
        case .watchTimeshift(let channel):
            return "timeshift/watch/\(channel)"
        case .watchTvod(let token, let provider):
            return "watch/vod/\(token)?provider=\(provider)"
        case .watchAvod(let token):
            return "avod/videos/\(token)/watch"
        case .watchVodVideo:
            return "watch/vod/video"
        case .watchVodTrailer:
            return "watch/vod/trailer"
        case .zuyaCatalog:
            return "zuya_catalog"
        case .zuyaSubscribe:
            return "zuya_subscribe"
        case .zuyaToken:
            return "zuya_token"
        }
    }
}
