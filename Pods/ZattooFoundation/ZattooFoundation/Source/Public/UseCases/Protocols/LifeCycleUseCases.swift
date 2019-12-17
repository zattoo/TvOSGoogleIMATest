//
//  LifeCycleUseCases.swift
//  ZattooFoundation
//
//  Created by David Cordero-Ramirez on 5/24/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


@objc public protocol LifeCycleUseCases {
    
    @objc
    func hello(success: @escaping (Session) -> Void,
               failure: @escaping (Error) -> Void)
    
    @objc
    func applicationDidReceiveMemoryWarning()

    @objc
    func applicationWillEnterForeground()
}
