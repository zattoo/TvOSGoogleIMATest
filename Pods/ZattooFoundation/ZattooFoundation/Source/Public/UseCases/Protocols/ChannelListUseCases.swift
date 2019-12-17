//
//  ChannelListUseCases.swift
//  ZattooFoundation
//
//  Created by Christopher Goldsby on 4/14/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc public protocol ChannelListUseCases {
    
    @objc
    func channel(withId channelId: ChannelId,
                 success: @escaping (Channel) -> Void,
                 failure: @escaping (Error) -> Void)
    
    @objc
    func channelListGroupBySections(success: @escaping ([ChannelGroup]) -> Void,
                                    failure: @escaping (Error) -> Void)
    
    @objc
    func refreshChannelListGroupBySections(success: @escaping ([ChannelGroup]) -> Void,
                                           failure: @escaping (Error) -> Void)
    
    @objc
    func channelListType(success: @escaping (ChannelListType) -> Void,
                         failure: @escaping (Error) -> Void)
    
    @objc
    func update(channelListType: ChannelListType,
                success: @escaping () -> Void,
                failure: @escaping (Error) -> Void)
    
    @objc
    func channelList(withType type: ChannelListType,
                     success: @escaping ([Channel]) -> Void,
                     failure: @escaping (Error) -> Void)
    
    @objc
    func refreshChannelList(withType type: ChannelListType,
                            success: @escaping ([Channel]) -> Void,
                            failure: @escaping (Error) -> Void)
}
