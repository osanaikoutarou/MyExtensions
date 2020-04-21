//
//  Array+Utility.swift
//  EventWorks
//
//  Created by 長内幸太郎 on 2018/06/24.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation

// https://medium.com/if-let-swift-programming/swift-array-removing-duplicate-elements-128a9d0ab8be
extension Array where Element: Equatable {
    mutating func removeDuplicates() {
        var result = [Element]()
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        self = result
    }
}

extension Array {
    init(reserveCapacity: Int) {
        self = Array<Element>()
        self.reserveCapacity(reserveCapacity)
    }
    
    /// スライス
    var slice: ArraySlice<Element> {
        self[self.startIndex ..< self.endIndex]
    }
}
