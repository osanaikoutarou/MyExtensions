//
//  NibInstantiatable.swift
//  SwiftExtensions
//
//  Created by Tatsuya Tanaka on 20171216.
//  Copyright © 2017年 tattn. All rights reserved.
//

import Foundation
import UIKit

protocol NibInstantiatable {
    static var nibName: String { get }
    static var nibBundle: Bundle { get }
    static var nibOwner: Any? { get }
    static var nibOptions: [AnyHashable: Any]? { get }
    static var instantiateIndex: Int { get }
}

extension NibInstantiatable where Self: NSObject {
    static var nibName: String { return className }
    static var nibBundle: Bundle { return Bundle(for: self) }
    static var nibOwner: Any? { return self }
    static var nibOptions: [AnyHashable: Any]? { return nil }
    static var instantiateIndex: Int { return 0 }
}

extension NibInstantiatable where Self: UIView {
    static func instantiate() -> Self {
        let nib = UINib(nibName: nibName, bundle: nibBundle)
        return nib.instantiate(withOwner: nibOwner, options: nibOptions as? [UINib.OptionsKey : Any])[instantiateIndex] as! Self
    }
}

protocol EmbeddedNibInstantiatable {
    associatedtype Embedded: NibInstantiatable
}

extension EmbeddedNibInstantiatable where Self: UIView, Embedded: UIView {
    var embedded: Embedded { return subviews[0] as! Embedded }

    func configureEmbededView() {
        let view = Embedded.instantiate()
        insertSubview(view, at: 0)
        view.fillSuperview()
    }
}
