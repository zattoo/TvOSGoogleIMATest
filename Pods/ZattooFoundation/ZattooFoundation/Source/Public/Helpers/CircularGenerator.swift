//
//  CircularGenerator.swift
//  ZattooFoundation
//
//  Created by Abraham Tomás Díaz Abreu on 15/07/16.
//  Copyright © 2016 Zattoo, Inc. All rights reserved.
//

import Foundation


final public class CircularGenerator<T>: IteratorProtocol {
    private var index = 0
    private var collection: [T] = []
    
    public var current: T? {
        guard collection.indices.contains(index) else { return nil }
        return collection[index]
    }
    
    public init(collection: [T], startingIndex: Int = 0) {
        self.collection = collection
        self.index = startingIndex
    }
    
    public func next() -> T? {
        guard !collection.isEmpty else { return nil }
        index += 1
        if index > collection.count - 1 {
            index = 0
        }
        return collection[index]
    }
    
    public func prev() -> T? {
        guard !collection.isEmpty else { return nil }
        index -= 1
        if index < 0 {
            index = collection.count - 1
        }
        return collection[index]
    }
}

