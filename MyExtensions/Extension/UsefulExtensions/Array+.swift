//
//  Array+.swift
//  SwiftExtensions
//
//  Created by Tatsuya Tanaka on 20171217.
//  Copyright © 2017年 tattn. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    @discardableResult
    mutating func remove(_ element: Element) -> Index? {
        guard let index = index(of: element) else { return nil }
        remove(at: index)
        return index
    }

    @discardableResult
    mutating func remove(_ elements: [Element]) -> [Index] {
        return elements.compactMap { remove($0) }
    }
}

extension Array where Element: Hashable {
    mutating func unify() {
        self = unified()
    }
}

extension Collection where Element: Hashable {
    func unified() -> [Element] {
        return reduce(into: []) {
            if !$0.contains($1) {
                $0.append($1)
            }
        }
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return startIndex <= index && index < endIndex ? self[index] : nil
    }
}
