//
//  TargetedExtension.swift
//  SwiftExtensions
//
//  Created by Tatsuya Tanaka on 20171218.
//  Copyright © 2017年 tattn. All rights reserved.
//

import Foundation

struct TargetedExtension<Base> {
    let base: Base
    init (_ base: Base) {
        self.base = base
    }
}

protocol TargetedExtensionCompatible {
    associatedtype Compatible
    static var ex: TargetedExtension<Compatible>.Type { get }
    var ex: TargetedExtension<Compatible> { get }
}

extension TargetedExtensionCompatible {
    static var ex: TargetedExtension<Self>.Type {
        return TargetedExtension<Self>.self
    }

    var ex: TargetedExtension<Self> {
        return TargetedExtension(self)
    }
}
